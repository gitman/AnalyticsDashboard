# encoding: UTF-8
require 'spec_helper'

describe UsersController do
  login_user

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  xit "should get index" do
    get 'index', {}
    expect(response.status).to eq(200)
    response.should be_success
  end
end
