class CreateRentComments < ActiveRecord::Migration[5.2]
  def change
    create_table :rent_comments do |t|
      t.string :content
      t.belongs_to :rent_post, foreign_key: true
      t.belongs_to :user
      t.timestamps
    end
  end
end
