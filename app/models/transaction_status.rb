# frozen_string_literal: true

# Model to store all the status of transactions like complete or pending.
class TransactionStatus < ApplicationRecord
  acts_as_paranoid column: :destroyed_at
  
  default_scope { order(:name) }

  has_many :transactions
end
