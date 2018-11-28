class RemoveColumnFromUsersTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :users_tables, :user_image_url, :text
  end
end
