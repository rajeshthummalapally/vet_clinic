class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :name,               null: false
      t.string :title,              default: ""
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      
      ## Address
      t.string  :address, default: ""
      t.string  :city,    default: ""
      t.string  :state,   default: ""
      t.integer :zip
      
      t.string  :school,   default: ""
      t.integer :years_in_practice, default: 1
      t.string  :role

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end
end
