class AddDatesToFestivals < ActiveRecord::Migration[8.1]
  def change
    add_column :festivals, :start_date, :date
    add_column :festivals, :end_date, :date
  end
end
