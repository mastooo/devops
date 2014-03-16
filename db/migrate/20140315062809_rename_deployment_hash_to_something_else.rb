class RenameDeploymentHashToSomethingElse < ActiveRecord::Migration
  def change
  	rename_column :deployments, :hash, :commit_hash
  end
end
