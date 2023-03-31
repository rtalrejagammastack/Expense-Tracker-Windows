# frozen_string_literal: true

# Model to Store Users data
class User < ApplicationRecord
  after_commit :create_default_category, on: :create

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone_number, presence: true, length: { is: 10, message: 'must have 10 length.' }

  has_many :categories, class_name: 'UserCategory', foreign_key: 'user_id'
  has_many :expense_categories, through: :categories
  has_many :sub_categories, through: :expense_categories
  has_many :transactions, class_name: 'Transaction', foreign_key: 'payer_id'
  has_many :receive_transactions, class_name: 'Transaction', foreign_key: 'receiver_id'

  private
  
  def create_default_category
    categories.create(name: 'Personal')
  end
end
# , class_name: 'ExpenseSubCategory', foreign_key: 'user_id', dependent: :destroy

# has_many :expense_categories, -> { where("user_category_id IS NULL OR user_category_id = ?", proxy_association.owner.user_categories.pluck(:id)) },  through: :user_categories

# def expense_categories_with_nil
#   categories.includes(:expense_categories).map do |user_category|
#     {
  #       user_category_id: user_category.id,
  #       expense_categories: user_category.expense_categories.pluck(:name) + ExpenseCategory.nil_fields.pluck(:name)
  #     }
  #   end
  # end
  
  # def expense_categories_with_nil
  #   expenses = categories.map do |user_category|
  #     {
  #       user_category.id => ExpenseCategory.fetch_user_expense_categories_with_nil(user_category.id).pluck(:name)
  #     }
  #   end
  #   expenses.inject(:merge)
  # end