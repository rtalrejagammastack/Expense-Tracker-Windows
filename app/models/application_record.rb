class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  # DEFAULT_EXPENSE_CATEGORIES = ExpenseCategory.where(user_category_id:nil).pluck(:name)

  def capital_first_letter
    self.name = name.capitalize unless name.nil? 
  end
end
