class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :products, null: false
      t.string :description_of_item, null: false
      t.integer :price, null: false
      t.integer :size, null: false
      t.integer :shipping_date, null:false
      t.integer :shipping_method, null:false
      t.integer :postage, null:false
      t.integer :shipping_origin, null: false
      t.integer :condition, null: false
      t.integer :status, null: false, default: 0
      t.integer :category, null: false
      t.string :brand
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
