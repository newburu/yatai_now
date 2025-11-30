class CreateMapSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :map_settings do |t|
      t.integer :refresh_mode, null: false, default: 0
      t.timestamps
    end
  end
end
