# frozen_string_literal: true

# Model to store the User Categories like Personal,Family or Hidden Expenses.
class UserCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  acts_as_paranoid column: :destroyed_at

  has_one_attached :background

  default_scope { order(:name) }

  # Callbacks
  after_validation :capital_first_letter
  
  # Validations
  validates :name, presence: true
  validate :default_category_cannot_be_changed
  validates :background, content_type: ['image/png', 'image/jpg', 'image/jpeg'], image: true

  # Associations
  belongs_to :user
  has_many :expense_categories, dependent: :destroy
  has_many :sub_categories, through: :expense_categories
  has_many :transactions, dependent: :destroy

  private 

  def default_category_cannot_be_changed
    if name_changed? && name_was == 'Personal'
      errors.add(:name, 'cannot be changed')
    end

    if ( destroyed? || destroyed_at.present? ) && name == 'Personal'
      errors.add(:base, 'cannot be destroyed')
    end
  end
end
