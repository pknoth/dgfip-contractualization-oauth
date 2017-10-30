require 'rails_helper'

RSpec.describe "oauth/users/show", type: :view do
  before(:each) do
    @oauth_user = assign(:oauth_user, Oauth::User.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
