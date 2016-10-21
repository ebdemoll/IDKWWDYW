class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.belongs_to :user, null: false
      t.belongs_to :usegroup, null: false
      t.string :find
      t.string :location
      t.string :category
    end
  end
end
