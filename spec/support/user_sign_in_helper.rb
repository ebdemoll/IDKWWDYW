module UserSignInHelper
  def login(user)
    visit '/'
    click_link 'Log In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
  end
end
