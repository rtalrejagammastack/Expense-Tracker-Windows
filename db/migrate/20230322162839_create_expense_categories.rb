class CreateExpenseCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_categories do |t|
      t.string :name
      t.boolean :show, default: true
      t.references :user_category, null: true, foreign_key: true
      t.string :slug
      
      t.timestamps
    end
    add_index :expense_categories, :slug, unique: true
  end
end
