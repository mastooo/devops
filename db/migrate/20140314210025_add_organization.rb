class AddOrganization < ActiveRecord::Migration
  def change
  	add_column :users, :organization_id, :string
  	add_column :users, :organization_name, :string
  end
end
