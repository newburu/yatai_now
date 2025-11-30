class MapController < ApplicationController
  def index
    active_festival = Festival.find_by(is_active: true)
    @enable_polling = active_festival ? active_festival.allow_anonymous_map_updates : true
  end
end
