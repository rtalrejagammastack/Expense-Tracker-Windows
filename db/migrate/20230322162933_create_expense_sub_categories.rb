class CreateExpenseSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_sub_categories do |t|
      t.string :name
      t.boolean :show, default: true
      t.references :category, null: false, foreign_key: { to_table: :expense_categories }
      t.references :user_category, null: true, foreign_key: true
      t.timestamps      
      t.string :slug
      
    end
    add_index :expense_sub_categories, :slug, unique: true
    # add_reference :expense_sub_categories, :user, index: true, foreign_key: true, optional: true
    # add_foreign_key :expense_sub_categories, :expense_categories, column: :category_id
  end
end
