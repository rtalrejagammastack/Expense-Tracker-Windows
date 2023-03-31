# frozen_string_literal: true

# Model to store all the categories of expenses.
class ExpenseCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  # Callbacks
  before_validation :capital_first_letter

  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :user_category, optional: true
  has_many :sub_categories, class_name: 'ExpenseSubCategory', foreign_key: 'category_id'

  scope :fetch_user_expense_categories_with_nil, ->(id) { where(user_category_id: [nil, id]).order(:name).where(show: true) }

  scope :fetch_user_expense_categories, ->(ids) { where(user_category_id: [nil, ids]).order(:name).where(show: true).group_by(&:user_category) }

  def user?
    user_category&.user
  end
end
