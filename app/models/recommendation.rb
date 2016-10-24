# frozen_string_literal: true
class Recommendation < ActiveRecord::Base
  belongs_to :recommendations

  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :yelp_rating, presence: true 
end
