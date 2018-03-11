class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :price, null: false
    end
    add_index :items, [:user_id, :name], unique: true
  end
end
