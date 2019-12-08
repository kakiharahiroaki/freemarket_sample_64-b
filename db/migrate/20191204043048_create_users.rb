class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :email, null: false
      t.integer :password, null: false
      t.integer :password_confirmation, null: false
      t.string :saler_items, null: false
      t.string :buyer_item, null: false
      t.string :sold_items, null: false
      
      t.timestamps
    end
  end
end
