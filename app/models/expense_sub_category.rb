# frozen_string_literal: true

# Model to store all the sub-categories of any categories.
class ExpenseSubCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  # Callbacks
  before_validation :capital_first_letter

  # Validations
  validates :name, presence: true, uniqueness: { scope: :category_id, message: ' %<value> already exists' }
  # validates :name, presence: true, uniqueness: { scope: [:user_id, :category_id], message: "%{value} already exists" }
  # validates_uniqueness_of :name, conditions: -> { where.not(show: 'false') }
  
  # Associations
  belongs_to :category, class_name: 'ExpenseCategory'
  belongs_to :user_category, optional: true
  has_many :transactions

  def user?
    user_category&.user
  end
end
