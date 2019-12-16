class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_name_katakana
      t.string :first_name_katakana
      t.integer :postcode, null: false
      t.integer :prefecture, null: false
      t.string :city, null:false
      t.string :block, null:false
      t.string :building
      t.integer :telephone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
