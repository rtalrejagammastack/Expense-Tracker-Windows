# frozen_string_literal: true

# Expenses operations and its filters operations
class ExpensesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    expenses = current_user.transactions.group_by { |transaction| transaction.created_at.to_date }
    @expenses_by_date = expenses.map { |date, expense| [date, expense] }.to_h
  end
end
