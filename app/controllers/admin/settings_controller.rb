class Admin::SettingsController < Admin::BaseController
  before_action :authenticate_user!
  # Punditなどでの認可チェックを追加することを推奨

  # GET /admin/settings/edit
  def edit
    # 表示用の設定値をインスタンス変数に格納
    @allow_anonymous_map_updates = Setting.get(:allow_anonymous_map_updates)
  end

  # PATCH /admin/settings
  def update
    # allow_anonymous_map_updates の値を更新
    # チェックボックスがオフの場合、paramsにキーが含まれないため、'false' を設定
    value = params[:settings] && params[:settings][:allow_anonymous_map_updates] == "1" ? "true" : "false"
    Setting.set(:allow_anonymous_map_updates, value)

    redirect_to edit_admin_settings_path, notice: "設定を更新しました。"
  end
end
