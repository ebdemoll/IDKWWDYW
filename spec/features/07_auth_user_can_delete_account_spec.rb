require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

describe 'Authorized user can delete account' do

  let!(:user_1) { FactoryGirl.create(:user) }

  feature 'Authorized user can delete their profile' do

    scenario 'User sees delete account button on show page' do
      login(user_1)
      click_link "Your Profile"

      expect(page).to have_link("Delete Account")
    end

    scenario 'User can click link and be removed from the site' do
      login(user_1)
      click_link "Your Profile"
      click_link "Delete Account"

      expect(page).to have_content("Welcome")
      expect(page).to have_content("Please sign in before continuing!")
    end
  end
end
