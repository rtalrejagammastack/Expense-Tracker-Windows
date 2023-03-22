class AddReferenceUserToExpenseSubCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :expense_sub_categories, :user, index: true, foreign_key: true, optional: true
  end
end
