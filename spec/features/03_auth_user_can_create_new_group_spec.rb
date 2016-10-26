require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

describe 'Unauth user can create and join a new group' do

  let!(:user_1) { FactoryGirl.create(:user) }

  feature 'Authorized user can create a new group' do

    scenario 'User sees Add New Group button on Index Page' do
      login(user_1)

      expect(page).to have_link 'Add New Group'
    end

    scenario 'User can add new group successfully' do
      login(user_1)
      click_link 'Add New Group'
      fill_in 'Name', with: 'TestGroup'
      click_button 'Add New Group'

      expect(page).to have_content "Group made and joined successfully!"
    end

    scenario 'User can add new group successfully' do
      login(user_1)
      click_link 'Add New Group'
      fill_in 'Name', with: 'TestGroup'
      click_button 'Add New Group'
      click_link'Your Groups'

      expect(page).to have_content "TestGroup"
    end
  end
end
