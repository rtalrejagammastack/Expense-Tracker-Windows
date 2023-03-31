# frozen_string_literal: true

# Model to store all the sub-categories of any categories.
class ExpenseSubCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  # Callbacks
  before_validation :capital_first_letter

  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :category, class_name: 'ExpenseCategory'
  belongs_to :user_category, optional: true
  has_many :transactions

  scope :fetch_expense_sub_categories_with_nil, ->(user_category_id, expense_category_id) { where(user_category_id: [nil, user_category_id]).where(category_id: expense_category_id).order(:name).where(show: true) }

  def user?
    user_category&.user
  end
end
