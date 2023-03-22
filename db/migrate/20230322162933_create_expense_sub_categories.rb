class CreateExpenseSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_sub_categories do |t|
      t.string :name
      t.references :category, null: false

      t.timestamps
    end
    add_foreign_key :expense_sub_categories, :expense_categories, column: :category_id
  end
end
