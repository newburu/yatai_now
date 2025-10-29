class CreateStalls < ActiveRecord::Migration[8.1]
  def change
    create_table :stalls do |t|
      t.references :festival, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :auth_code
      t.string :status_text

      t.timestamps
    end
  end
end
