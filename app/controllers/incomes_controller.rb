# frozen_string_literal: true

# Incomes operations and its filters operations
class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = current_user.receive_transactions.ransack(params[:q])
    @transactions = @q.result.paginate(page: params[:page])
    incomes = @transactions.group_by { |transaction| transaction.created_at.to_date }
    @incomes_by_date = incomes.map { |date, income| [date, income] }.to_h    
  end
end
