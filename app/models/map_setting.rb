class MapSetting < ApplicationRecord
  # refresh_modeカラムにenumを定義
  # 0: ajax_for_all (全員がAJAXで自動更新)
  # 1: reload_for_all (全員が手動リロードで更新)
  # 2: ajax_for_logged_in (ログインユーザーのみAJAXで自動更新)
  enum refresh_mode: { ajax_for_all: 0, reload_for_all: 1, ajax_for_logged_in: 2 }

  # バリデーション
  validates :refresh_mode, presence: true, inclusion: { in: refresh_modes.keys }

  #-- シングルトン化 --
  # 常にサイト全体で一つの設定レコードしか存在しないようにするための設定

  # 1. newメソッドをprivateにする (外部から new できないようにする)
  private_class_method :new

  # 2. 唯一のインスタンスを取得するためのクラスメソッド
  def self.current
    # (Cachable) 既に読み込まれていればそれを返す
    # 読み込まれていなければ、DBから最初の一つを取得するか、なければデフォルト値で作成
    RequestStore.store[:map_setting] ||= first_or_create!(refresh_mode: :ajax_for_all)
  end

  # 3. レコードが1つしか作られないようにDBレベルでも制約をかける
  validate :ensure_only_one_record, on: :create

  private

  def ensure_only_one_record
    if MapSetting.exists?
      errors.add(:base, "MapSetting record already exists. Use MapSetting.current to access it.")
    end
  end
end
