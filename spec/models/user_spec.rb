require 'rails_helper'

describe User, type: :model do

  it { should have_valid(:name).when('Foobington') }
  it { should have_valid(:email).when('Foobington@email.com') }
  it { should have_valid(:password).when('password') }

end
