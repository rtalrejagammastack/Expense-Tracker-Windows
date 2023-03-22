# frozen_string_literal: true

# Model to store all the status of transactions like complete or pending.
class TransactionStatus < ApplicationRecord
  has_many :transactions
end
