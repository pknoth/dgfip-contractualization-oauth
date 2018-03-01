class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  belongs_to :account_type
  has_many :access_grants, class_name: 'Doorkeeper::AccessGrant', foreign_key: 'resource_owner_id'

  validates :email, uniqueness: { scope: :account_type }, presence: true

  def self.find_for_authentication(warden_conditions)
    where(
      email: warden_conditions[:email],
      account_type_id: warden_conditions[:account_type_id]
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
