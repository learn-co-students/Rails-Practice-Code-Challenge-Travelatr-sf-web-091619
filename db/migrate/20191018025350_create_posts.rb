class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :likes
      t.references :blogger, foreign_key: true
      t.references :destination, foreign_key: true
    end
  end
end
