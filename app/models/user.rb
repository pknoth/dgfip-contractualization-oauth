class User < ApplicationRecord
  devise :database_authenticatable

  belongs_to :resource_provider

  validates :email, uniqueness: { scope: :resource_provider }, presence: true

  def self.find_for_authentication(warden_conditions)
    where(
      email: warden_conditions[:email],
      resource_provider_id: warden_conditions[:resource_provider_id]
    ).first
  end
end
