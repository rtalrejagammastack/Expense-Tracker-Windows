class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.boolean :read, default: false

      t.timestamps
    end
  end
end