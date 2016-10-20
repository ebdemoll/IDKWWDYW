module UserSignInHelper
  def login_with_google(username = "foobington")
    visit auth_path(:google_oauth2)
  end
end
