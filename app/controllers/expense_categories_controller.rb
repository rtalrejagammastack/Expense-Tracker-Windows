class ExpenseCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_category, only: [:new,:create]

  def index
    @user_categories = UserCategory.where("user_id=?",current_user.id)
  end

  def new
    @expense_category = ExpenseCategory.new
  end

  def create    
    @expense_category = @user_category.expense_categories.new(expense_category_params)

    if @expense_category.save
      redirect_to @expense_category, notice: "Successfully created Expense Category."
    else
      # render :new
      redirect_to new_category_expense_category_path(@user_category),alert: "Unable to create Expense Category.Try Again..."
    end
  end

  private
  
  def expense_category_params
    params.require(:expense_category).permit(:name)
  end

  def category_id_param
    params.permit(:category_id)
  end

  def set_user_category
    @user_category = UserCategory.find_by_id(category_id_param[:category_id])
  end
end
