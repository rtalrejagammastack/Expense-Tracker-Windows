class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :title
      t.float :amount
      t.text :description
      t.string :payer_name
      t.string :receiver_name
      t.references :user_category, null: false, foreign_key: true
      t.references :expense_category, nul: false, foreign_key: { to_table: :expense_sub_categories }
      t.references :status, null: false, foreign_key: { to_table: :transaction_statuses }
      t.references :type, null: false, foreign_key: { to_table: :transaction_types }
      t.references :mode, null: false, foreign_key: { to_table: :transaction_modes }
      t.references :receiver, null: true, foreign_key: { to_table: :users }
      t.references :payer, null: true, foreign_key: { to_table: :users }
      t.string :slug

      t.timestamps
    end
    add_index :transactions, :slug, unique: true
  end
end
