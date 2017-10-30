require 'rails_helper'

RSpec.describe "oauth/users/new", type: :view do
  before(:each) do
    assign(:oauth_user, Oauth::User.new())
  end

  it "renders new oauth_user form" do
    render

    assert_select "form[action=?][method=?]", oauth_users_path, "post" do
    end
  end
end
