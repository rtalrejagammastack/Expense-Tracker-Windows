class TransactionJob < ApplicationJob
  queue_as :high_priority

  def perform(transaction, current_user)
    # Do something later
    TransactionMailer.new_transaction(transaction, current_user).deliver
end
