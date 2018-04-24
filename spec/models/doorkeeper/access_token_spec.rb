require 'rails_helper'

RSpec.describe Doorkeeper::AccessToken do
  it 'sets resource_owner account_type scopes on save' do
    account_type = FactoryGirl.create(:account_type, scopes: %w[a b])
    resource_owner = User.create(email: 'test@test.test', account_type: account_type)
    application = Doorkeeper::Application.create(name: 'test', redirect_uri: 'https://test.test')
    access_token = described_class.create(application_id: application.id, expires_in: Time.now + 1.minute, resource_owner: resource_owner, scopes: 'c')
    expect(access_token.scopes).to eq(%w[a b c])
  end
end
