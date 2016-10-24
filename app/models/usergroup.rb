# frozen_string_literal: true
class Usergroup < ActiveRecord::Base
  has_many :preferences
  has_many :invites
  has_many :memberships
  has_many :users, through: :memberships
  belongs_to :recommendations

  validates :name, presence: true
end
