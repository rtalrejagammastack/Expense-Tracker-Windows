class ExpensesController < ApplicationController
  def index 
    @expenses = current_user.transactions
  end
end
