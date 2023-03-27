class CreateExpenseCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_categories do |t|
      t.string :name
      t.references :user_category, null: true, foreign_key: true

      t.timestamps
    end
  end
end
