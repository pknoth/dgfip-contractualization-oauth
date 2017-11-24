class AddResourceProviderIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :resource_provider_id, :integer
  end
end
