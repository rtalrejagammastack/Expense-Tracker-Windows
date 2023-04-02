# frozen_string_literal: true

# Model to Store Users data
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid column: :destroyed_at

  has_one_attached :profile_image, dependent: :destroy
  
  # Callbacks
  after_create :create_default_category

  # Validations
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone_number, presence: true, length: { is: 10, message: 'must have 10 length.' }
  validates :profile_image, content_type: ['image/png', 'image/jpg', 'image/jpeg'], image: true

  # Associations
  has_many :categories, class_name: 'UserCategory', foreign_key: 'user_id', dependent: :destroy
  has_many :expense_categories, through: :categories
  has_many :sub_categories, through: :categories
  has_many :transactions, class_name: 'Transaction', foreign_key: 'payer_id', dependent: :destroy
  has_many :receive_transactions, class_name: 'Transaction', foreign_key: 'receiver_id', dependent: :destroy

  private

  def create_default_category
    categories.create(name: 'Personal')
  end
end
