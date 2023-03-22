class ExpensesController < ApplicationController
  def index

  end
  def new
    @expense = Transaction.new
  end
end
