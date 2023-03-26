class CreateUserCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_categories do |t|
      t.string :name
      t.decimal :expense, default: 0.0
      t.decimal :income, default: 0.0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
