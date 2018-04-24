module Doorkeeper
  module AccessTokenAdditions
    extend ActiveSupport::Concern
    included do
      belongs_to :resource_owner, class_name: 'User'

      before_validation :set_scopes, on: :create

      private

      def set_scopes
        owner_scopes = OAuth::Scopes.from_array(resource_owner.account_type.scopes)
        self.scopes = (scopes + owner_scopes).to_s
      end
    end
  end
end
