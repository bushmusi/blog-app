class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :post_id
      t.bigint :author_id
      t.index :post_id
      t.index :author_id
      t.timestamps
    end
    add_foreign_key :likes, :posts, column: :post_id, on_delete: :cascade
    add_foreign_key :likes, :users, column: :author_id, on_delete: :cascade
  end
end
