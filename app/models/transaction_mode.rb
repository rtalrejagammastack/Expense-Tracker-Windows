# frozen_string_literal: true

# Model to store all the modes of transactions like cash,upi or cards payments.
class TransactionMode < ApplicationRecord
  acts_as_paranoid column: :destroyed_at

  default_scope { order(:name) }

  has_many :transactions
end
