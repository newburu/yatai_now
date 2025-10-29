class Stall < ApplicationRecord
  belongs_to :festival
  belongs_to :user

  has_many :locations

  # 「最新の位置情報1件だけ」を簡単に取得するための関連付け
  has_one :latest_location, -> { order(timestamp: :desc) }, class_name: "Location"
end
