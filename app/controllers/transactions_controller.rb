class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @transaction = Transaction.new
    @user_categories = current_user.categories
    @transaction_statuses = TransactionStatus.all
    @transaction_modes = TransactionMode.all
  end
  def create
    @t = TransactionType.find_by_name(transaction_params[:type])
    @user_category = current_user.categories.find_by_slug(transaction_params[:user_category_slug]) 
    @transaction = Transaction.new(transaction_params)
    @transaction.type =  @t
    @transaction.user_category = @user_category
    
    if @transaction.save
      redirect_to home_path, notice: "Transaction Successfully Created."
    else
      render :new
    end
  end

  def fetch_expense_categories
    category = current_user.categories.find_by_slug(params[:slug])
    options = category.fetch_expense_categories
    render json: options.to_json(only: [:slug, :name])
  end

  def fetch_expense_sub_categories
    expense_categories = ExpenseCategory.fetch_user_expense_categories(current_user.categories.pluck(:id))
    expense_category = expense_categories.find_by_slug(params[:slug])
    options = expense_category.fetch_sub_categories(expense_category.user_category_id)
    render json: options.to_json(only: [:slug, :name])  
  end

  private
  def transaction_params
    params.require(:transaction).permit(:title, :receiver_name, :payer_name, :amount, :type, :status_id, :mode_id, :user_category_slug, :expense_category_id, :description)
  end
end
