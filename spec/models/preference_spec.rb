require 'rails_helper'

describe Preference, type: :model do

  it { should have_valid(:user_id).when(2) }
  it { should have_valid(:find).when('tacos, dinner') }
  it { should have_valid(:location).when('Boston, MA') }
  it { should have_valid(:usergroup_id).when(2) }

end
