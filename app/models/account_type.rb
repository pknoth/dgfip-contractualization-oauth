class AccountType < ApplicationRecord
  has_many :users

  class << self
    def dgfip
      where(name: 'dgfip').first
    end

    def service_provider
      where(name: 'service_provider').first
    end
  end
end
