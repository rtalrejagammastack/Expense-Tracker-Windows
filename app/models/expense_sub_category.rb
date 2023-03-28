# frozen_string_literal: true

# Model to store all the sub-categories of any categories.
class ExpenseSubCategory < ApplicationRecord
  before_validation :capital_first_letter

  validates :name, presence: true, uniqueness: { scope: [:user_id, :category_id], message: "%{value} already exists" }
  # validates_uniqueness_of :name, conditions: -> { where.not(show: 'false') }
  
  belongs_to :category, class_name: 'ExpenseCategory'
  belongs_to :user_category, optional: true

  def user?
    self.user_category&.user 
  end
end
