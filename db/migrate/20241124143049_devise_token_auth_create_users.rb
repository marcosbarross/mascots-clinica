class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email
      t.datetime :last_sign_in_at
      t.integer :sign_in_count, default: 0
      t.string :authentication_token

      # Adicionando as colunas do Devise Token Auth
      t.string :provider, default: "email", null: false
      t.string :uid, null: false, default: ""

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
    add_index :users, :authentication_token, unique: true
    add_index :users, [:uid, :provider], unique: true # Índice para UID + Provider
  end
end
