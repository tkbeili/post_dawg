class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.text :body
      t.references :category, index: true
      t.string :address
      t.attachment :image
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
