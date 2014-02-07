require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      # Sign in as a user.
      sign_in_as_a_valid_user

      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_path
      expect(response.status).to be(200)
    end

    it "Redirects us when not authenticated." do
      # Invoke the request we're testing.
      get users_path

      # Ensure we get the expected response code.
      response.status.should be(302)
    end   
  end
end
