class CreateLocations < ActiveRecord::Migration[8.1]
  def change
    create_table :locations do |t|
      t.references :stall, null: false, foreign_key: true
      t.decimal :latitude
      t.decimal :longitude
      t.datetime :timestamp

      t.timestamps
    end
  end
end
