module AuthenticationHelper
  def login_with_oauth(service = :google_oauth2)
    visit "/auth/#{service}"
  end

  def sign_in_as(user)
    mock_auth_for(user)
    visit "/"
    click_link "Sign in with Google"
  end

  def mock_auth_for(user)
    OmniAuth.config.add_mock(
        :google_oauth2,
        {
            :info => {
            :email => 'test@some_test_domain.com',
            :name=>'Test User'
        }
    })
  end
end
