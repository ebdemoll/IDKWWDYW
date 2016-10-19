module AuthenticationHelper
  def sign_in_as(user)
    mock_auth_for(user)
    visit "/"
    click_link "Sign in with Google"
  end

  def mock_auth_for(user)
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
      "provider" => user.provider,
      "uid" => user.uid,
      "name" => user.name,
      "oauth_token" => user.oauth_token,
      "oauth_expires_at" => user.oauth_expires_at
    )
  end
end
