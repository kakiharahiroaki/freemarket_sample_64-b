class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer :status, null: false
      t.integer :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
