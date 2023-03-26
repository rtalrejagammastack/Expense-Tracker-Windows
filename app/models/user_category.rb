# frozen_string_literal: true

# Model to store the User Categories like Personal,Family or Hidden Expenses.
class UserCategory < ApplicationRecord
  before_validation :capital_first_letter

  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id, message: "%{value} already exists" }
  
  private
  
  def capital_first_letter
    self.name = name.capitalize
  end
end