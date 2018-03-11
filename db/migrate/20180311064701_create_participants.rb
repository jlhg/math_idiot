class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
    end
    add_index :participants, [:user_id, :name], unique: true
  end
end
