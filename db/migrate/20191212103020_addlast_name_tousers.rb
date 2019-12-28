class AddlastNameTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, :null => false
    add_column :users, :introduce, :text
    add_column :users, :family_name_kanji, :string, :null => false
    add_column :users, :first_name_kanji, :string, :null => false
    add_column :users, :family_name_kana, :string, :null => false
    add_column :users, :first_name_kana, :string, :null => false
    add_column :users, :birthdata_year, :integer, :null => false
    add_column :users, :birthdata_month, :integer, :null => false
    add_column :users, :birthdata_day, :integer, :null => false
    add_column :users, :phone_number, :string, :null => false
    
  end
end
