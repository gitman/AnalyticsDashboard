# encoding: UTF-8
require 'spec_helper'

describe UsersController do
  login_admin

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  it "should get index" do
    get :index
    expect(response).to be_success
    expect(response.status).to eq(200)
  end

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "loads all of the posts into @posts" do
    user1, user2 = User.make!, User.make!
    get :index

    expect(assigns(:users)).to match_array([subject.current_user, user1, user2])
  end
end
