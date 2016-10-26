require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

describe 'Authorized user can choose which groups they belong to' do

  let!(:user_1) { FactoryGirl.create(:user) }

  feature 'Authorized user can leave a group they no longer want to belong to' do

    scenario 'User sees leave group button on show page' do
      login(user_1)
      click_link "Add New Group"
      fill_in 'Name', with: "testgroup"
      click_button 'Add New Group'
      click_link "Your Groups"
      click_link "testgroup"

      expect(page).to have_link("Leave This Group")
    end


      scenario 'User can click link and be removed from group' do
        login(user_1)
        click_link "Add New Group"
        fill_in 'Name', with: "testgroup"
        click_button 'Add New Group'
        click_link "Your Groups"
        click_link "testgroup"
        click_link "Leave This Group"

        expect(page).to_not have_content("testgroup")
      end
  end
end
