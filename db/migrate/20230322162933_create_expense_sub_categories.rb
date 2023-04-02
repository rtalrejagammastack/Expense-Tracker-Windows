class CreateExpenseSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_sub_categories do |t|
      t.string :name
      t.references :category, null: false, foreign_key: { to_table: :expense_categories }
      t.references :user_category, null: true, foreign_key: true
      t.timestamps      
      t.string :slug
      
    end
    add_index :expense_sub_categories, :slug, unique: true
  end
end
