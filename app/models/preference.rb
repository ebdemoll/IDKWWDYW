class Preference < ApplicationRecord
  belongs_to :user
  belongs_to :usergroup

end
