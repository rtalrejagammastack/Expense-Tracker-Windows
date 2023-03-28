class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:edit,:show,:update,:destroy]

  def new
    @category = UserCategory.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to category_path(@category), notice: 'Category successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: "Some issue in creating Category.Try Again..."
      # redirect_to new_category_path, alert: 'Some issue in creating Category.Try Again...'
    end
  end

  def show
    @transactions = @category.transactions
  end

  def edit

  end

  def update
    puts "####################3"
    puts @category
    # @category.update(update_params);
    # respond_to do |format|
    #   format.js
    # end
  end

  def destroy
    if @category.destroy
      redirect_to home_path, notice: 'Category Successfully Deleted.'
    else
      redirect_to home_path, alert: 'Category Deletion Failed.'
    end
  end

  private

  def category_params
    params.require(:user_category).permit(:name)
  end

  def update_params
    params.permit(:name)
  end

  def set_category
    @category = UserCategory.friendly.find_by_slug(params[:slug])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to home_path, notice: error
  end
end
