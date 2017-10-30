require 'rails_helper'

RSpec.describe "oauth/users/edit", type: :view do
  before(:each) do
    @oauth_user = assign(:oauth_user, Oauth::User.create!())
  end

  it "renders the edit oauth_user form" do
    render

    assert_select "form[action=?][method=?]", oauth_user_path(@oauth_user), "post" do
    end
  end
end
