# frozen_string_literal: true

# Transaction operations
class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @transaction = Transaction.new
    @user_categories = current_user.categories
    @transaction_statuses = TransactionStatus.all
    @transaction_modes = TransactionMode.all
  end
  
  def create
    transaction_type = TransactionType.find_by_name(params[:transaction][:type])
    @transaction = Transaction.new(transaction_params)
    @transaction.type =  transaction_type

    if @transaction.type == TransactionType.find_by_name('Expense')
      @transaction.payer = current_user
    else
      @transaction.receiver = current_user
    end

    if @transaction.save
      redirect_to home_path, notice: 'Transaction Successfully Created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Unable to create Transaction.Try Again...'
    end
  end

  def fetch_expense_categories
    user_category = current_user.categories.find_by_id(params[:id])
    options = ExpenseCategory.fetch_user_expense_categories_with_nil(user_category.id)
    render json: options.to_json(only: %i[id name])
  end

  def fetch_expense_sub_categories
    expense_category = ExpenseCategory.find_by_id(params[:id])
    user_category = current_user.categories.find_by_id(params[:user_category_id])
    options = ExpenseSubCategory.fetch_expense_sub_categories_with_nil(user_category.id, expense_category.id)
    render json: options.to_json(only: %i[id name])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:title, :receiver_name, :payer_name, :amount, :status_id, :mode_id, :user_category_id, :expense_category_id, :description)
  end
end
