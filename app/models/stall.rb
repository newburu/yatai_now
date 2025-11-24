# app/models/stall.rb
class Stall < ApplicationRecord
  has_one_attached :icon
  belongs_to :festival

  # user_id を manager_id として扱う (userモデルとの関連名を 'manager' にする)
  belongs_to :manager, class_name: "User", foreign_key: "user_id"

  has_many :locations

  # 「最新の位置情報1件だけ」を簡単に取得するための関連付け
  has_one :latest_location, -> { order(timestamp: :desc) }, class_name: "Location"

  # GPS合言葉を自動生成する（任意）
  before_create :generate_auth_code

  private

  def generate_auth_code
    # 例: "A地区" -> "A-chiku-" + ランダム文字列
    self.auth_code ||= "#{self.name.parameterize}-#{SecureRandom.alphanumeric(6)}"
  end
end
