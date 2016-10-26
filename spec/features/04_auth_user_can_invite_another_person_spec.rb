require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

feature 'User sends email invite to another person' do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  let!(:user_1) { FactoryGirl.create(:user) }

  let!(:user_2) { FactoryGirl.create(:user) }

  let!(:usergroup_1) { FactoryGirl.create(:usergroup) }

  let!(:invite) do
    Invite.create(
      email: user_1.email,
      sender_id: user_1.id,
      token: 89837587598,
      usergroup_id: usergroup_1.id
    )
  end


  scenario 'User can fill in a form to invite someone' do
    login(user_1)
    click_link "Add New Group"
    fill_in 'Name', with: "testgroup"
    click_button 'Add New Group'
    click_link "Your Groups"
    click_link "testgroup"
    click_link 'Invite New User to Group'

    expect(page).to have_button 'Send'
  end

  scenario 'User can fill in a form to invite someone' do
    login(user_1)
    click_link "Add New Group"
    fill_in 'Name', with: "testgroup"
    click_button 'Add New Group'
    click_link "Your Groups"
    click_link "testgroup"
    click_link 'Invite New User to Group'
    fill_in "Email", with: 'testemail@gmail.com'
    click_button 'Send'

    expect(page).to have_content 'Invite Sent'
    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(ActionMailer::Base.deliveries.first.to).to eq(["testemail@gmail.com"])
    expect(ActionMailer::Base.deliveries.first.from).to eq(['idkwdywmailer@gmail.com'])
  end
end
