class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :github_id
      t.string :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
