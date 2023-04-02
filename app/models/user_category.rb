# frozen_string_literal: true

# Model to store the User Categories like Personal,Family or Hidden Expenses.
class UserCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  acts_as_paranoid column: :destroyed_at

  # Callbacks
  after_validation :capital_first_letter
  
  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :user
  has_many :expense_categories, dependent: :destroy
  has_many :sub_categories, through: :expense_categories
  has_many :transactions, dependent: :destroy
end
