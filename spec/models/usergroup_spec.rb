require 'rails_helper'

describe Usergroup, type: :model do

  it { should have_valid(:name).when('TestGroup') }

end
