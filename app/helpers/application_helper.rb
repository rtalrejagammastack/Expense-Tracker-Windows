# frozen_string_literal: true

# Main Application Helper
module ApplicationHelper
  def user_categories
    current_user.categories if user_signed_in?
  end
  def transaction_types
    TransactionType.all if user_signed_in?
  end
end
