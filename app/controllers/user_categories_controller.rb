# frozen_string_literal: true

# User Categories operations
class UserCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category, only: %i[edit show update destroy]

  def index
  end

  def new
    @user_category = UserCategory.new
  end

  def create
    @user_category = current_user.categories.new(category_params)
    if @user_category.save
      redirect_to user_category_path(@user_category), notice: 'Category successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Some issue in creating Category.Try Again...'
    end
  end

  def show
    @transactions = @user_category.transactions
  end

  def edit
  end

  def update
    if @user_category.update(category_params)
      redirect_to user_category_path(@user_category), notice: 'Category successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @user_category.destroy
      redirect_to home_path, notice: 'Category Successfully Deleted.'
    else
      redirect_to @user_category, alert: 'Category Deletion Failed.'
    end
  end

  private

  def category_params
    params.require(:user_category).permit(:name)
  end

  def find_user_category
    @user_category = UserCategory.friendly.find_by_slug(params[:slug])
  end
end
