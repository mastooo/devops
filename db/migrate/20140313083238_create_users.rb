class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :provider
      t.string :token
      t.string :image

      t.timestamps
    end
  end
end