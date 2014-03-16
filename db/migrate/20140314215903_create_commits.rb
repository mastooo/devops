class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :hash
      t.text :message
      t.references :member, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
