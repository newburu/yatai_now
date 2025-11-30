class Admin::MapSettingsController < Admin::BaseController
  before_action :set_map_setting

  def show
    # @map_setting is set by before_action
  end

  def edit
    # @map_setting is set by before_action
  end

  def update
    if @map_setting.update(map_setting_params)
      redirect_to admin_map_setting_path, notice: '地図の更新設定を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_map_setting
    @map_setting = MapSetting.current
  end

  def map_setting_params
    params.require(:map_setting).permit(:refresh_mode)
  end
end
