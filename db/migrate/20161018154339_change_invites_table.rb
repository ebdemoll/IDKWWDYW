class ChangeInvitesTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :invites, :user_group_id, :integer
    add_column :invites, :usergroup_id, :integer
  end
end
