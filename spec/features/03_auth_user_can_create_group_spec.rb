# frozen_string_literal: true
require 'rails_helper'
require 'spec_helper'

describe 'User can ' do

  let!(:user_1) { FactoryGirl.create(:user) }

  feature 'add a group' do

    scenario 'user adds new group successfully' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log In'
      click_link 'Add New Group'
      expect(page).to have_content 'New Group Form'

      fill_in 'Name', with: 'Test Group'

      click_button 'Add New Group'

      expect(page).to have_content 'Group added successfully'
    end

    scenario 'visitor does not provide proper information for a location' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log In'
      click_link 'Add New Group'
      click_button 'Add New Group'
      expect(page).to have_content 'Name can\'t be blank'

    end
  end
end
