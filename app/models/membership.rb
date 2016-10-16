# frozen_string_literal: true
class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :usergroup

  validates :user, presence: true
  validates :usergroup, presence: true
  validates :unique_user_and_usergroup, presence: true, if: :unique_user_and_usergroup

  def unique_user_and_usergroup
    membership = Membership.find_by(usergroup_id: :usergroup_id, user_id: :user_id)
    !membership.nil?
  end
end
