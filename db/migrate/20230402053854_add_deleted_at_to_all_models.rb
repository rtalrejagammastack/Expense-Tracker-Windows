class AddDeletedAtToAllModels < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :destroyed_at, :datetime
    add_index :users, :destroyed_at

    add_column :user_categories, :destroyed_at, :datetime
    add_index :user_categories, :destroyed_at
    
    add_column :transaction_statuses, :destroyed_at, :datetime
    add_index :transaction_statuses, :destroyed_at
    
    add_column :transaction_modes, :destroyed_at, :datetime
    add_index :transaction_modes, :destroyed_at
    
    add_column :transaction_types, :destroyed_at, :datetime
    add_index :transaction_types, :destroyed_at

    add_column :transactions, :destroyed_at, :datetime
    add_index :transactions, :destroyed_at

    add_column :expense_categories, :destroyed_at, :datetime
    add_index :expense_categories, :destroyed_at
    
    add_column :expense_sub_categories, :destroyed_at, :datetime
    add_index :expense_sub_categories, :destroyed_at
  end
end
