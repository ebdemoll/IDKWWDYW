class EditUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :admin, :boolean, default: false
    add_column :users, :image, :string
  end
end
