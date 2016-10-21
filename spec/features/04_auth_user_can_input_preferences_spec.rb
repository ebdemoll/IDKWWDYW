require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

feature 'User submits their personal preferences for dinner' do

  let!(:user_1) { FactoryGirl.create(:user, name: 'foobington') }

  let!(:user_2) { FactoryGirl.create(:user) }

  let!(:usergroup_1) { FactoryGirl.create(:usergroup) }

  let!(:membership) do
      Membership.create(
        user_id: user_1.id,
        usergroup_id: usergroup_1.id
      )
    end

  scenario 'User who hasn\'t submitted preferences yet sees a form to submit preferences' do
    login_with_google(user_1.name)
    visit root_path
    click_link "Add New Group"
    fill_in 'Name', with: "testgroup"
    click_button 'Add New Group'
    click_link "Your Groups"
    click_link "testgroup"

    expect(page).to have_content("Find")
    expect(page).to have_content("Location")
    expect(page).to have_content("Category")
    expect(page).to have_button("Submit Preferences")
  end

  scenario 'User can submit preferences through a form' do
    login_with_google(user_1.name)
    visit root_path
    click_link "Add New Group"
    fill_in 'Name', with: "testgroup"
    click_button 'Add New Group'
    click_link "Your Groups"
    click_link "testgroup"
    fill_in 'Find', with: "Dinner"
    fill_in 'Location', with: "Boston, MA"
    fill_in 'Category', with: 'Pizza'
    click_button 'Submit Preferences'

    expect(page).to have_content('Preferences updated')
    expect(page).to have_content('(This user has submitted their prefences.)')
  end
  scenario 'User who has submitted preferences does not see a form to submit preferences' do

  end
end
