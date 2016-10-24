class AddTrackerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :usergroups, :chooser, :integer
  end
end
