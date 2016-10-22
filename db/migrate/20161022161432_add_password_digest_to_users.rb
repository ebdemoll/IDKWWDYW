class AddPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :salt, :string
    add_column :users, :name, :string
    add_column :users, :password_digest, :string
  end
end
