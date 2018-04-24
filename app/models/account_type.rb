class AccountType < ApplicationRecord
  has_many :users

  class << self
    %w[service_provider api_particulier dgfip cnaf].each do |role|
      define_method(role.to_sym) do
        find_by(name: role)
      end
    end
  end
end
