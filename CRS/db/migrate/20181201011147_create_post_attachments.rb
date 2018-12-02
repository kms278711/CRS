class CreatePostAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_attachments do |t|
      t.belongs_to :rent_post
      t.string :image

      t.timestamps
    end
  end
end
