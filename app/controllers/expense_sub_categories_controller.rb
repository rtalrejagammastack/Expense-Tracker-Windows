# frozen_string_literal: true

# Expense Sub Categories operations
class ExpenseSubCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category
  before_action :find_expense_category
  before_action :find_expense_sub_category, only: %i[edit update destroy]

  def new
    @expense_sub_category = ExpenseSubCategory.new
  end

  def create
    @expense_sub_category = @expense_category.sub_categories.new(expense_sub_category_params)

    if @expense_sub_category.save
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Successfully created Expense Sub Category.'
    else
      render :new, status: :unprocessable_entity, alert: 'Unable to create Expense Sub Category.Try Again...'
    end
  end

  def edit
  end

  def update
    if @expense_sub_category.update(expense_sub_category_params)
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Successfully update the Expense Sub Category.'
    else
      render :edit, status: :unprocessable_entity, alert: 'Unable to update Expense Sub Category.Try Again...'
    end
  end

  def destroy
    if @expense_sub_category.update(show: false)
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Successfully delete the sub-category.'
    else
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Unable to delete the category.try Again....'
    end
  end

  private

  def expense_sub_category_params
    params.require(:expense_sub_category).permit(:name).merge(user_category_id: @user_category.id)
  end

  def find_user_category
    @user_category = UserCategory.friendly.find_by_slug(params[:user_category_slug])
  end

  def find_expense_category
    @expense_category = ExpenseCategory.friendly.find_by_slug(params[:expense_category_slug])
  end

  def find_expense_sub_category
    @expense_sub_category = ExpenseSubCategory.friendly.find_by_slug(params[:slug])
  end
end
