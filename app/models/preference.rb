class Preference < ApplicationRecord
  belongs_to :user
  belongs_to :usergroup

  validates :user, presence: true
  validates :usergroup, presence: true 

end
