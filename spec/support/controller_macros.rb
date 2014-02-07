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
