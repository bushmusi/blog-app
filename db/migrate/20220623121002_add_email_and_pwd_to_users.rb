class AddEmailAndPwdToUsers < ActiveRecord::Migration[7.0]
  def change
    # database auth
    add_column :users, :encrypted_password, :string
    add_column :users, :email, :string
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :string
  end
end
