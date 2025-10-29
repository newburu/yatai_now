class Api::V1::LocationsController < ApplicationController
  # 認証をスキップ（合言葉で認証するため）
  skip_before_action :verify_authenticity_token

  def create
    # 1. 合言葉で屋台を検索
    stall = Stall.find_by(auth_code: params[:auth_code])

    if stall
      # 2. 位置情報をDBに保存
      stall.locations.create!(
        latitude: params[:latitude],
        longitude: params[:longitude],
        timestamp: Time.current
      )
      render json: { status: "success" }, status: :created
    else
      render json: { error: "Invalid auth code" }, status: :unauthorized
    end
  end
end
