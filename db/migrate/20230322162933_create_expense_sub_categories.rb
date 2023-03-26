class CreateExpenseSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_sub_categories do |t|
      t.string :name
      t.references :category, null: false, foreign_key: { to_table: :expense_categories }
      t.timestamps
    end
    # add_reference :expense_sub_categories, :user, index: true, foreign_key: true, optional: true
    # add_foreign_key :expense_sub_categories, :expense_categories, column: :category_id
  end
end
