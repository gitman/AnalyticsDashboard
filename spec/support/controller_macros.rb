module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.make!
      user.add_role :admin
      user.confirm!
      sign_in user
    end
  end
end

module ValidUserRequestHelper
  # Define a method which signs in as a valid user.
  def sign_in_as_a_valid_user
      user = User.make!
      user.add_role :admin
      user.confirm!

    # We action the login request using the parameters before we begin.
    # The login requests will match these to the user we just created in the factory, and authenticate us.
    post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end
end
