require 'rails_helper'

describe Invite, type: :model do

  it { should have_valid(:email).when('foobington@email.com') }
  it { should have_valid(:sender_id).when(2) }
  it { should have_valid(:usergroup_id).when(4) }
  it { should have_valid(:token).when(28340375487598437598475) }

end
