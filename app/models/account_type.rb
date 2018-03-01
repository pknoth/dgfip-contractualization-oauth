class AccountType < ApplicationRecord
  has_many :users

  def dgfip
    where(name: 'dgfip').first
  end

  def service_provider
    where(name: 'service_provider').first
  end
end
