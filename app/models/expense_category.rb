# frozen_string_literal: true

# Model to store all the categories of expenses.
class ExpenseCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user_id, message: "%{value} already exists" }

  has_many :sub_categories, class_name: 'ExpenseSubCategory', foreign_key: 'category_id', dependent: :destroy
  belongs_to :user, class_name: 'User', optional: true
end
