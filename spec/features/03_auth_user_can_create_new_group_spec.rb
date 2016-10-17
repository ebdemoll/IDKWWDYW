# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

describe 'Unauth user can sign in' do

  let!(:user_1) { FactoryGirl.create(:user) }

  feature 'Authorized user can create a new group' do

    scenario 'User sees Add New Group button on Index Page' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log In'

      expect(page).to have_link 'Add New Group'
    end

    scenario 'User can add new group successfully' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log In'
      click_link 'Add New Group'
      fill_in 'Name', with: 'TestGroup'
      click_button 'Add New Group'

      expect(page).to have_content 'Group joined successfully'
    end
  end
end
