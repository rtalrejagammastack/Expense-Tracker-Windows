class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = UserCategory.new
  end

  def create
    @user = current_user
    @category = @user.categories.create(category_params)

    if @category.save
      redirect_to category_path(@category), notice: 'Category successfully created.'
    else
      # render :new
      redirect_to new_category_path, alert: 'Some issue in creating Category.Try Again...'
    end
  end

  def show
    @category = UserCategory.find_by_id(params[:id])
    @transactions = @category.transactions
  end

  def update

  end

  def destroy
    @category = UserCategory.find_by_id(params[:id])
    if @category.destroy
      redirect_to root_path, notice: 'Category Successfully Deleted.'
    else
      redirect_to root_path, alert: 'Category Deletion Failed.'
    end
  end

  private

  def category_params
    params.require(:user_category).permit(:name)
  end
end
