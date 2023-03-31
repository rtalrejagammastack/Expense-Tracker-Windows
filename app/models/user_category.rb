# frozen_string_literal: true

# Model to store the User Categories like Personal,Family or Hidden Expenses.
class UserCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  before_validation :capital_first_letter

  belongs_to :user
  has_many :expense_categories
  has_many :sub_categories, through: :expense_categories
  has_many :transactions
  
  validates :name, presence: true
  
  def fetch_expense_categories
    ExpenseCategory.where(user_category_id:[nil,id]).where(show:true).order(:name)
  end
end



# scope :load_expense_categories, -> { ExpenseCategory.where("department_id = ?", selected_department) }
# scope :fetch_expense_categories, -> { ExpenseCategory.where(user_category_id:[nil,ids]).where(show:true).order(:name) }
# has_many :expense_sub_categories, through: :expense_categories
# validates :name, presence: true, uniqueness: { scope: :user_id, message: "%{value} already exists" }