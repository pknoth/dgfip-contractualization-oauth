class AddScopesToAccountTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :account_types, :scopes, 'text[]', default: []
  end
end
