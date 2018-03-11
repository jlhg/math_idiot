class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :participant, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
    end
    add_index :orders, [:participant_id, :item_id], unique: true
  end
end
