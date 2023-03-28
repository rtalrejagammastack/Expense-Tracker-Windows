class ExpenseCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_category
  before_action :set_expense_category, only: [:show,:edit,:update,:destroy]

  def main
    @user_categories = UserCategory.where("user_id=?",current_user.id)
  end

  def index
    @expense_categories = @user_category.fetch_expense_categories
  end

  def new
    @expense_category = ExpenseCategory.new
  end

  def create    
    @expense_category = @user_category.expense_categories.new(expense_category_params)

    if @expense_category.save
      redirect_to category_expense_category_path(@user_category,@expense_category), notice: "Successfully created Expense Category."
    else
      render :new
      # redirect_to new_category_expense_category_path(@user_category), alert: "Unable to create Expense Category.Try Again..."
    end
  end

  def show
  end
  

  def edit
  end

  def update
    if @expense_category.update(expense_category_params)
      redirect_to category_expense_category_path(@user_category,@expense_category), notice: "Successfully update the Expense Category."
    else
      redirect_to edit_category_expense_category_path(@user_category,@expense_category), alert: "Unable to update Expense Category.Try Again..."
    end
  end

  def destroy
    if @expense_category.update(show:false) && @expense_category.sub_categories.update(show:false)
      redirect_to category_expense_categories_path(@user_category), notice: "Successfully delete the category."
    else
      redirect_to category_expense_categories_path(@user_category), notice: "Unable to delete the category.try Again...."
    end
  end

  private
  
  def expense_category_params
    params.require(:expense_category).permit(:name)
  end

  def ids_params
    params.permit(:category_slug,:slug)
  end

  def set_user_category
    @user_category = UserCategory.friendly.find_by_slug(ids_params[:category_slug])
  end

  def set_expense_category
    @expense_category = ExpenseCategory.find_by_id(ids_params[:id])
  end
end
