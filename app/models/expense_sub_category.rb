# frozen_string_literal: true

# Model to store all the sub-categories of any categories.
class ExpenseSubCategory < ApplicationRecord
  belongs_to :category, class_name: 'ExpenseCategory'
  belongs_to :user, optional: true
end
