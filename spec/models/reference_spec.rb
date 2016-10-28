require 'rails_helper'

describe Recommendation, type: :model do

  it { should have_valid(:usergroup_id).when(2) }
  it { should have_valid(:name).when('tacos, dinner') }
  it { should have_valid(:phone).when('617-555-5555') }
  it { should have_valid(:address).when('54 Maple Drive') }
  it { should have_valid(:yelp_rating).when('4') }

end
