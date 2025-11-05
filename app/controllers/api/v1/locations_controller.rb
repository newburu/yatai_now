# app/controllers/api/v1/locations_controller.rb

class Api::V1::LocationsController < ApplicationController
  # ★重要: 外部（スマホブラウザ）からのPOSTリクエストを受け付けるため、CSRF保護を無効化する
  skip_before_action :verify_authenticity_token

  # POST /api/v1/locations
  def create
    # 1. パラメータから合言葉で屋台を検索
    stall = Stall.find_by(auth_code: params[:auth_code])

    if stall
      # 2. 屋台が見つかったら、位置情報をDBに保存
      location = stall.locations.new(
        latitude: params[:latitude],
        longitude: params[:longitude],
        timestamp: Time.current
      )

      if location.save
        render json: { status: "success", message: "Location updated." }, status: :created
      else
        render json: { status: "error", errors: location.errors.full_messages }, status: :unprocessable_entity
      end
    else
      # 3. 合言葉が間違っていたらエラーを返す
      render json: { status: "error", message: "Invalid auth code." }, status: :unauthorized
    end
  end
end
