class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :products, null: false
      t.string :description_of_item, null: false
      t.integer :price, null: false
      t.integer :size, null: false
      t.integer :shipping_date, null:false
      t.string :shipping_method, null:false
      t.integer :postage, null:false
      t.string :shipping_origin, null: false
      t.string :condition, null: false
      t.integer :brand_id, null: false, foreign_key: true
      t.integer :category_id, null:false, foreign_key: true
      t.integer :user_id, null:false, foreign_key: true
      t.integer :saler_id, null:false, foreign_key: true
      t.integer :buyer_id, null:false, foreign_key: true
      t.timestamps
    end
  end
end
