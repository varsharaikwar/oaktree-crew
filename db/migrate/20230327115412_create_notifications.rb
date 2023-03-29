class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.string :sender_type
      t.integer :reciver_id
      t.string :reciver_type
      t.boolean :read, null: false, default: false
      t.references :lead, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
