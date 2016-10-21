class ChangePreferencesTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :preferences, :usegroup_id, :integer
    add_column :preferences, :usergroup_id, :integer, null: false 
  end
end
