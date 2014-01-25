class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.text :body
      t.references :category, index: true
      t.string :address
      t.attachment :image
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
