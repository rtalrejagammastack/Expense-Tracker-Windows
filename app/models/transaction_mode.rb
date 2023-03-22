# frozen_string_literal: true

# Model to store all the modes of transactions like cash,upi or cards payments.
class TransactionMode < ApplicationRecord
  has_many :transactions
end
