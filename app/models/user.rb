class User < ApplicationRecord
  devise :database_authenticatable

  belongs_to :resource_provider
  has_many :access_grants, class_name: 'Doorkeeper::AccessGrant', foreign_key: 'resource_owner_id'

  validates :email, uniqueness: { scope: :resource_provider }, presence: true

  def self.find_for_authentication(warden_conditions)
    where(
      email: warden_conditions[:email],
      resource_provider_id: warden_conditions[:resource_provider_id]
    ).first
  end

  def current_scopes
    access_grants.last.scopes.to_a
  end

  def as_json(*params)
    super.merge(
      scopes: current_scopes,
      resource_provider: resource_provider.name,
      roles: roles,
      uid: id
    )
  end
end
