# frozen_string_literal: true

# Transaction operations
class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category
  before_action :find_transaction, only: %i[edit update destroy show]
  before_action :fetch_transaction_form_data, only: %i[new edit]

  def new
    @transaction = Transaction.new
  end
  
  def create
    transaction_type = TransactionType.find_by_name(params[:transaction][:type])
    @transaction = Transaction.new(transaction_params)
    @transaction.type =  transaction_type
    
    if transaction_type == TransactionType.find_by_name('Expense')
      @transaction.payer = current_user
    else
      @transaction.receiver = current_user
    end
    
    if @transaction.save
      redirect_to @transaction, notice: 'Transaction Successfully Created.'
      TransactionJob.perform_later(@transaction, current_user)
    else
      render :new, status: :unprocessable_entity, alert: 'Unable to create Transaction.Try Again...'
    end
  end

  def edit
  end

  def show
    
  end

  def update
    transaction_type = TransactionType.find_by_name(params[:transaction][:type])
    @transaction_update = transaction_params.merge(type_id: transaction_type.id)
    if transaction_type.name == TransactionType.find_by_name('Expense')
      @transaction_update[:payer_id] = current_user.id
      @transaction_update[:receiver_id] = nil
    else
      @transaction_update[:receiver_id] = current_user.id
      @transaction_update[:payer_id]=nil
    end
    if @transaction.update(@transaction_update)
      redirect_to home_index_path, notice: "Successfully update the Transaction."
    else
      render :edit, status: :unprocessable_entity, alert: 'Unable to update Transaction. Try Again....'
    end
  end

  def destroy
    if @transaction.destroy
      redirect_to home_index_path, notice: 'Transaction Successfully Deleted.'
    else
      redirect_to home_index_path, alert: 'Transaction Deletion Failed.'
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
  
  def fetch_transaction_form_data
    @transaction_types = TransactionType.all
    @valid_type = TransactionType.where("name=?",params[:type]).first&.name || "Expense"
    @status_options = TransactionStatus.all.map do |status| 
      [status.name, status.id]
    end
    @modes_options = TransactionMode.all.map do |mode| 
      [mode.name, mode.id]
    end
    @user_categories_options = current_user.categories.map do |user_category| 
      [user_category.name, user_category.id]
    end
  end
  
  private

  def transaction_params
    params.require(:transaction).permit(:title, :receiver_name, :payer_name, :amount, :status_id, :mode_id, :user_category_id, :expense_category_id, :description, :documents)
  end

  def find_user_category
    @user_category = UserCategory.friendly.find_by_slug(params[:user_category_slug])
  end

  def find_transaction
    @transaction = Transaction.friendly.find_by_slug(params[:slug])
  end
end
