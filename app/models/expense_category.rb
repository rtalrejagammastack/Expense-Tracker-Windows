# frozen_string_literal: true

# Model to store all the categories of expenses.
class ExpenseCategory < ApplicationRecord
  before_validation :capital_first_letter

  validates :name, presence: true, uniqueness: { scope: :user_category_id, message: "%{value} already exists" }

  belongs_to :user_category, optional: true
  has_many :sub_categories, class_name: 'ExpenseSubCategory', foreign_key: 'category_id', dependent: :destroy

  def fetch_sub_categories(user_category)
    self.sub_categories.where(user_category_id:[nil,user_category])
  end

  def user?
      self.user_category.user unless self.user_category.nil?
  end
end
