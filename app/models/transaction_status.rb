# frozen_string_literal: true

# Model to store all the status of transactions like complete or pending.
class TransactionStatus < ApplicationRecord
  acts_as_paranoid column: :destroyed_at

  has_many :transactions
end
