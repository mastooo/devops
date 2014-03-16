class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.string :hash
      t.references :user, index: true

      t.timestamps
    end
  end
end
