class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :title
      t.float :amount
      t.text :description
      t.references :user_category, null: false, foreign_key: true
      t.references :expense_category, nul: false
      t.references :status, null: false
      t.references :type, null: false
      t.references :mode, null: false
      t.references :receiver, null: false
      t.references :payer, null: false

      t.timestamps
    end
    add_foreign_key :transactions, :transaction_statuses, column: :status_id
    add_foreign_key :transactions, :transaction_types, column: :type_id
    add_foreign_key :transactions, :transaction_modes, column: :mode_id
    add_foreign_key :transactions, :users, column: :receiver_id
    add_foreign_key :transactions, :users, column: :payer_id
    add_foreign_key :transactions, :expense_sub_categories, column: :expense_category_id
  end
end
