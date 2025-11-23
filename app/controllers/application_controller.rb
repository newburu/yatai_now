class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # 【追加】1. 専用の例外クラスを定義
  # (本来は app/errors/ などにファイル分けすることもありますが、簡単のためここに定義します)
  class NoAssignedYataiError < StandardError; end

  # 本番環境でのみ適用する設定ブロック（前回の続き）
  unless Rails.env.development?
    rescue_from StandardError, with: :render_500
    # 汎用的なエラーの rescue は最後に書くのが基本
  end

  # 【追加】2. 担当屋台未登録エラーを捕捉する設定
  # これは開発環境でも確認しやすいよう、unless ブロックの外に書くか、
  # 開発環境の設定(consider_all_requests_local)を変更して確認します。
  # ここでは、常に捕捉される位置に記述する例とします。
  rescue_from NoAssignedYataiError, with: :render_no_assigned_yatai

  private

  # ... render_500 メソッドなど ...

  # 【追加】3. 専用画面を表示するメソッド
  def render_no_assigned_yatai
    # ステータスコードは状況によりますが、ここでは「処理できない状態」として 422 を使ってみます。
    render template: "errors/no_assigned_yatai", status: :unprocessable_entity, layout: false
  end
end
