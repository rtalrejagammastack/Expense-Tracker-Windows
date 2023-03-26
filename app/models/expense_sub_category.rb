# frozen_string_literal: true

# Model to store all the sub-categories of any categories.
class ExpenseSubCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :category_id, message: "%{value} already exists" }
  
  belongs_to :category, class_name: 'ExpenseCategory'
end
