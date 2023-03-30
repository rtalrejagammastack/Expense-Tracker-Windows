# frozen_string_literal: true

# Model to store all the transactions
class Transaction < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged
  
  belongs_to :status, class_name: 'TransactionStatus'
  belongs_to :type, class_name: 'TransactionType'
  belongs_to :mode, class_name: 'TransactionMode'
  belongs_to :receiver, class_name: 'User', optional: true
  belongs_to :payer, class_name: 'User', optional: true
  belongs_to :user_category
  belongs_to :expense_category, class_name: 'ExpenseSubCategory'
end
