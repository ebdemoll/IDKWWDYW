# frozen_string_literal: true
class Usergroup < ActiveRecord::Base

  validates :name, presence: true

end
