class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users_tables do |t|
      t.string :name
      t.text :user_image_url

      t.timestamps
    end
  end
end
