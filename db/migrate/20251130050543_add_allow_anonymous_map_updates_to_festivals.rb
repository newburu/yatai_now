class AddAllowAnonymousMapUpdatesToFestivals < ActiveRecord::Migration[8.1]
  def change
    add_column :festivals, :allow_anonymous_map_updates, :boolean, default: true, null: false
  end
end
