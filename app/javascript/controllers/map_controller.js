import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // --- 設定 ---
  static values = {
    apiKey: String,
    enablePolling: Boolean,
    userSignedIn: Boolean
  }

  // --- ライフサイクル ---
  connect() {
    this.API_URL = '/api/v1/map_data';
    this.UPDATE_INTERVAL = 30000; // 30秒
    this.markers = {}; // マーカーオブジェクトを屋台IDごとに保存

    // コールバックとしてメソッドが使用される際に正しいコンテキストを確保するために `this` をバインド
    this.initMap = this.initMap.bind(this);
    this.updateMapMarkers = this.updateMapMarkers.bind(this);

    this.loadGoogleMapsAPI();
  }

  disconnect() {
    // コントローラーが切断されたとき（例：ページ遷移時）にインターバルを停止
    if (this.updateInterval) {
      clearInterval(this.updateInterval);
      console.log('地図の更新インターバルを停止しました。');
    }
  }

  // --- Google Maps API 処理 ---
  loadGoogleMapsAPI() {
    // スクリプトが既に存在する場合は再読み込みを回避
    if (window.google && window.google.maps) {
      this.initMap();
      return;
    }

    // Google Maps APIが読み込み完了時に実行するグローバルコールバック関数を設定
    window.initMap = this.initMap;

    // scriptタグを作成し、ドキュメントのheadに追加
    const script = document.createElement('script');
    script.src = `https://maps.googleapis.com/maps/api/js?key=${this.apiKeyValue}&callback=initMap`;
    script.async = true;
    document.head.appendChild(script);
  }

  // --- 地図の初期化と更新 ---

  /**
   * Google Mapを初期化します。このメソッドはGoogle Maps APIのコールバックです。
   */
  initMap() {
    this.map = new google.maps.Map(this.element, {
      center: { lat: 34.8394, lng: 134.6939 }, // 姫路駅周辺
      zoom: 13,
    });

    // 初回マーカーを取得して表示
    this.updateMapMarkers(true);

    // マーカーを定期的に更新するためのインターバルを設定
    this.updateInterval = setInterval(this.updateMapMarkers, this.UPDATE_INTERVAL);
  }

  /**
   * APIから屋台データを取得し、地図上のマーカーを更新します。
   * @param {boolean} firstLoad - 初回読み込みかどうかを示します。
   */
  async updateMapMarkers(firstLoad = false) {
    // 2回目以降の更新では、未ログインユーザーのポーリングが無効かチェック
    if (!firstLoad && !this.enablePollingValue && !this.userSignedInValue) {
      location.reload(); // サーバーでレンダリングされた最新のデータを取得するためにリロード
      return;
    }

    console.log('地図データを取得中...');
    try {
      const response = await fetch(this.API_URL);
      if (!response.ok) {
        console.error('地図データの取得に失敗しました');
        return;
      }

      const stalls = await response.json();
      this.processStallData(stalls);
      console.log('地図を更新しました。');

    } catch (error) {
      console.error('地図の更新中にエラーが発生しました:', error);
    }
  }

  /**
   * 屋台データを処理し、地図上のマーカーを更新または作成します。
   * @param {Array} stalls - APIから取得した屋台オブジェクトの配列。
   */
  processStallData(stalls) {
    stalls.forEach(stall => {
      const latNum = parseFloat(stall.latitude);
      const lngNum = parseFloat(stall.longitude);

      // 処理を続行する前に、位置情報データが有効であることを確認
      if (isNaN(latNum) || isNaN(lngNum)) {
        console.warn(`無効な位置情報データのため、屋台 ${stall.id} をスキップします:`, stall);
        return;
      }

      const stallId = stall.id;
      const position = { lat: latNum, lng: lngNum };
      const infoWindowContent = `
        <strong>${stall.name}</strong><br>
        状況: ${stall.status || '不明'}<br>
        最終更新: ${new Date(stall.last_updated).toLocaleTimeString()}
      `;

      if (this.markers[stallId]) {
        // マーカーが既に存在する場合、そのプロパティを更新
        this.updateExistingMarker(this.markers[stallId], position, infoWindowContent, stall.icon_url);
      } else {
        // マーカーが存在しない場合、新しいマーカーを作成
        this.createNewMarker(stallId, position, stall.name, infoWindowContent, stall.icon_url);
      }
    });
  }

  /**
   * 既存のマーカーの位置、情報ウィンドウ、アイコンを更新します。
   */
  updateExistingMarker(markerData, position, content, iconUrl) {
    markerData.marker.setPosition(position);
    markerData.infoWindow.setContent(content);
    markerData.marker.setIcon(this.createIcon(iconUrl));
  }

  /**
   * 新しいマーカーを作成して保存します。
   */
  createNewMarker(stallId, position, title, content, iconUrl) {
    const infoWindow = new google.maps.InfoWindow({ content });

    const marker = new google.maps.Marker({
      position,
      map: this.map,
      title,
      icon: this.createIcon(iconUrl),
    });

    marker.addListener('click', () => {
      infoWindow.open({ anchor: marker, map: this.map });
    });

    // 新しいマーカーとその情報ウィンドウを保存
    this.markers[stallId] = { marker, infoWindow };
  }

  /**
   * マーカー用のスケールされたアイコンオブジェクトを作成します。
   * @param {string|null} url - アイコンのURL。
   * @returns {google.maps.Icon|null}
   */
  createIcon(url) {
    if (!url) return null;
    return {
      url,
      scaledSize: new google.maps.Size(40, 40),
    };
  }
}
