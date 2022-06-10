class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.bigint :author_id
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.index :author_id
      t.timestamps
    end
    add_foreign_key :posts, :users, column: :author_id, on_delete: :cascade
  end
end
