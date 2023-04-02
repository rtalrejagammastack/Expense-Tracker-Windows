# frozen_string_literal: true

# Model to store all the type of transactions like income or expense.
class TransactionType < ApplicationRecord
  acts_as_paranoid column: :destroyed_at

  has_many :transactions
end
