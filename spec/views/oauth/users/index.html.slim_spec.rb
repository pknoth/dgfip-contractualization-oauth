require 'rails_helper'

RSpec.describe "oauth/users/index", type: :view do
  before(:each) do
    assign(:oauth_users, [
      Oauth::User.create!(),
      Oauth::User.create!()
    ])
  end

  it "renders a list of oauth/users" do
    render
  end
end
