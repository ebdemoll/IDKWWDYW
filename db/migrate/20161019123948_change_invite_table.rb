class ChangeInviteTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :invites, :recipient_id, :integer
  end
end
