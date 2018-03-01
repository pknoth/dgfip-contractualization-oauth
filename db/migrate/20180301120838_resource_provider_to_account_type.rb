class ResourceProviderToAccountType < ActiveRecord::Migration[5.1]
  def change
    rename_table :resource_providers, :account_types
    rename_column :users, :resource_provider_id, :account_type_id

    AccountType.where(name: 'service_provider').first_or_create
    AccountType.where(name: 'dgfip').first_or_create
  end
end
