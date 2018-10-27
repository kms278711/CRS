class CreateRentPosts < ActiveRecord::Migration[5.2]
  
  def change
    create_table :rent_posts do |t|
      t.string :lens_name
      t.string :image
      t.string :mount
      t.string :zoom_lens
      t.integer :distance
      t.integer :aperture
      t.boolean :is
      t.string :location
      t.integer :price
      t.boolean :rented
      t.text :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
