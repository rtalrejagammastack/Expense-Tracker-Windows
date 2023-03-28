class ExpenseSubCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_category
  before_action :set_expense_category
  before_action :set_expense_sub_category, only: [:edit,:update,:destroy]

  def new
    @expense_sub_category = ExpenseSubCategory.new
  end

  def create    
    @expense_sub_category = @expense_category.sub_categories.new(expense_sub_category_params)

    @expense_sub_category.user_category = @user_category
    if @expense_sub_category.save
      redirect_to category_expense_category_path(@user_category,@expense_category), notice: "Successfully created Expense Sub Category."
    else
      redirect_to new_category_expense_category_expense_sub_category_path(@user_category,@expense_category), alert: "Unable to create Expense Sub Category.Try Again..."
    end
  end

  def edit
  end

  def update
    if @expense_sub_category.update(expense_sub_category_params)
      redirect_to category_expense_category_path(@user_category,@expense_category), notice: "Successfully update the Expense Sub Category."
    else
      redirect_to edit_category_expense_category_expense_sub_category_path(@user_category,@expense_category,@expense_sub_category), alert: "Unable to update Expense Sub Category.Try Again..."
    end
  end

  def destroy
    if @expense_sub_category.update(show:false)
      redirect_to category_expense_category_path(@user_category,@expense_category), notice: "Successfully delete the sub-category."
    else
      redirect_to category_expense_category_path(@user_category,@expense_category), notice: "Unable to delete the category.try Again...."
    end
  end

  private
  
  def expense_sub_category_params
    params.require(:expense_sub_category).permit(:name)
  end

  def ids_params
    params.permit(:category_id,:expense_category_id,:id)
  end

  def set_user_category
    @user_category = UserCategory.find_by_id(ids_params[:category_id])
  end

  def set_expense_category
    @expense_category = ExpenseCategory.find_by_id(ids_params[:expense_category_id])
  end

  def set_expense_sub_category
    @expense_sub_category = ExpenseSubCategory.find_by_id(ids_params[:id])
  end
end
