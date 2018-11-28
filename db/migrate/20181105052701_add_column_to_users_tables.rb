class AddColumnToUsersTables < ActiveRecord::Migration[5.1]
  def change
    add_column :users_tables, :email, :string
    add_column :users_tables, :password_digest, :string
  end
end
