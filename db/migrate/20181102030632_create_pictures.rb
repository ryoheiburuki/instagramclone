class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :sentence
      t.text :image_url

      t.timestamps
    end
  end
end
