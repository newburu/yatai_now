class Api::V1::MapDataController < ApplicationController
  def index
    # 1. 現在開催中の祭りを探す
    active_festival = Festival.find_by(is_active: true)

    # 2. 関連付け (has_one :latest_location) を使って効率的にデータを取得
    stalls_with_location = active_festival.stalls.includes(:latest_location)

    # 3. 地図に表示したい情報だけをJSONで返す
    data = stalls_with_location.map do |stall|
      {
        id: stall.id,
        name: stall.name,
        status: stall.status_text,
        lat: stall.latest_location&.latitude, # &.(ぼっち演算子)で位置情報が無くてもエラーにしない
        lng: stall.latest_location&.longitude,
        updated_at: stall.latest_location&.timestamp
      }
    end

    render json: data
  end
end
