class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.belongs_to :usergroup
      t.string :name
      t.string :phone
      t.string :address
      t.string :yelp_rating
    end
  end
end
