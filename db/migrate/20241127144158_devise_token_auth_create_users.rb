class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.string :provider, null: false, default: 'email'
      t.string :uid, null: false, default: ''
      t.boolean :allow_password_change, :default => false
      # Indexes
      t.json :tokens
    end
    add_index :users, [:uid, :provider], unique: true 
  end
end
