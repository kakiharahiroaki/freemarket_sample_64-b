class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string :users, :provider
      t.string :users, :uid
      t.string :users, :token
      t.timestamps
    end
  end
end
