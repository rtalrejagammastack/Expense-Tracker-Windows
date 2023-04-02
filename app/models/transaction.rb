# frozen_string_literal: true

# Model to store all the transactions
class Transaction < ApplicationRecord
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  acts_as_paranoid column: :destroyed_at

  has_many_attached :documents, dependent: :destroy

  default_scope { order(created_at: :desc) }
  
  # Validations
  validates :amount, presence: :true
  validates :documents, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'application/pdf','application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']

  # Associations
  belongs_to :status, class_name: 'TransactionStatus'
  belongs_to :type, class_name: 'TransactionType'
  belongs_to :mode, class_name: 'TransactionMode'
  belongs_to :receiver, class_name: 'User', optional: true
  belongs_to :payer, class_name: 'User', optional: true
  belongs_to :user_category
  belongs_to :expense_category, class_name: 'ExpenseSubCategory'

  scope :belonging_to_user, ->(user) { where(user: current_user) }

  def self.ransackable_associations(*)
    ['user_category']
  end

  def self.ransackable_scopes(auth_object = nil)
    [:belonging_to_user_category]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "description", "destroyed_at", "expense_category_id", "id", "mode_id", "payer_id", "payer_name", "receiver_id", "receiver_name", "slug", "status_id", "title", "type_id", "updated_at", "user_category_id"]
  end

end
