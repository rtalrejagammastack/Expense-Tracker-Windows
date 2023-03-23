class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = UserCategory.new
  end

  def create
    @user = current_user
    @category = @user.categories.create(category_params)

    if @category.save
      redirect_to root_path
    else
      redirect_to new_category_path
    end
  end

  def show
    @category = UserCategory.find_by_id(params[:id])
    @transactions = @category.transactions
  end

  def destroy
    @category = UserCategory.find_by_id(params[:id])
    @category.destroy
    redirect_to root_path
  end

  private

  def category_params
    params.require(:user_category).permit(:name)
  end
end