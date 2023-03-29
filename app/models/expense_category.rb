# frozen_string_literal: true

# Model to store all the categories of expenses.
class ExpenseCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  # Callbacks
  before_validation :capital_first_letter

  # Validations
  validates :name, presence: true, uniqueness: { scope: :user_category_id, message: '%< value > already exists' }
  # validate :check_name

  # Associaions
  belongs_to :user_category, optional: true
  has_many :sub_categories, class_name: 'ExpenseSubCategory', foreign_key: 'category_id'

  def fetch_sub_categories(user_category)
    sub_categories.where(user_category_id: [nil, user_category]).where(show: true).order(:name)
  end

  def fetch_sub_categories_names(user_category)
    fetch_sub_categories(user_category).pluck(:name).join(', ')
  end

  def user?
    user_category&.user
  end

  # def check_name
  #   errors.add(:name, ' already Exists.') if DEFAULT_EXPENSE_CATEGORIES.index(name)
  # end
end
