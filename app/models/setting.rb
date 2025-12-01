class Setting < ApplicationRecord
  # バリデーション
  validates :key, presence: true, uniqueness: true

  # keyに対応する設定値を取得するクラスメソッド
  # 存在しない場合は、キーに応じたデフォルト値を返す
  def self.get(key)
    setting = find_by(key: key)
    if setting
      # 値を型変換して返す
      case key.to_sym
      when :allow_anonymous_map_updates
        setting.value == "true"
      else
        setting.value
      end
    else
      # デフォルト値
      case key.to_sym
      when :allow_anonymous_map_updates
        true # デフォルトでは許可する
      else
        nil
      end
    end
  end

  # keyに対応する設定値を保存（または更新）するクラスメソッド
  def self.set(key, value)
    setting = find_or_initialize_by(key: key)
    setting.value = value.to_s # すべての値を文字列として保存
    setting.save!
  end
end
