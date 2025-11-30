class MapController < ApplicationController
  def index
    @map_setting = MapSetting.current
  end
end
