class Api::V1::MapDataController < ApplicationController
  def index
    # 1. 現在開催中の祭りを探す
    active_festival = Festival.find_by(is_active: true)

    if active_festival.nil?
      render json: { error: "Active festival not found" }, status: :not_found
      return
    end

    # 2. その祭りに属する屋台と、各屋台の「最新の位置情報」「アイコン」を効率的に取得
    #    (Stallモデルに定義した `has_one :latest_location` がここで活躍します)
    stalls = active_festival.stalls.includes(:latest_location, icon_attachment: :blob)

    # 3. 地図に表示するために必要な情報だけを抽出して、JSON用の配列を作成
    data = stalls.map do |stall|
      icon_url = stall.icon.attached? ? url_for(stall.icon) : nil
      {
        id: stall.id,
        name: stall.name,
        status: stall.status_text,
        icon_url: icon_url,

        # (latest_location がまだ存在しない場合(nil) も考慮する)
        latitude: stall.latest_location&.latitude,
        longitude: stall.latest_location&.longitude,
        last_updated: stall.latest_location&.timestamp
      }
    end

    # 4. JSONデータとして返す
    render json: data
  end
end
