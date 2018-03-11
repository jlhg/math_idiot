class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :line_key, null: false

      t.timestamps
    end
    add_index :users, :line_key, unique: true
  end
end
