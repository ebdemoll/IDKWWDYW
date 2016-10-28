require 'rails_helper'

describe Membership, type: :model do

  it { should have_valid(:user_id).when(2) }
  it { should have_valid(:usergroup_id).when(4) }

end
