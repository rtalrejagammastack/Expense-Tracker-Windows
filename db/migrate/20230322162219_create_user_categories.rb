class CreateUserCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_categories do |t|
      t.string :name
      t.float :expense
      t.float :income
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
