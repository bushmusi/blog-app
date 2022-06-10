class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :author_id
      t.bigint :post_id
      t.text :text
      t.index :post_id
      t.index :author_id
      t.timestamps
    end
    add_foreign_key :comments, :posts, column: :post_id, on_delete: :cascade
    add_foreign_key :comments, :users, column: :author_id, on_delete: :cascade
  end
end
