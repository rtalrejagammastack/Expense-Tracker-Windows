# frozen_string_literal: true

# Expenses operations and its filters operations
class ExpensesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @expenses = current_user.transactions
  end
end
