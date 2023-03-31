class ExpenseCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category
  before_action :find_expense_category, only: [:show,:edit,:update,:destroy]

  def all
    @user_categories = current_user.categories
    @expense_categories = ExpenseCategory.fetch_user_expense_categories(@user_categories)

    @user_categories.each do |user_category|
      @expense_categories[user_category].each do |expense_category|
        @expense_sub_categories[expense_category&.id] = ExpenseSubCategory.fetch_expense_sub_categories_with_nil( user_category.id, expense_category.id )
      end
    end

    # @expense_categories = { }
    # @expense_sub_categories = { }
    # @user_categories.each do |user_category|
    #   @expense_categories[user_category.id] =  ExpenseCategory.fetch_user_expense_categories_with_nil(user_category)
    #   @expense_categories[user_category.id].each do |expense_category|
    #     @expense_sub_categories[expense_category.id] = ExpenseSubCategory.fetch_expense_sub_categories_with_nil( user_category.id, expense_category.id )
    #   end
    # end
  end

  def index
    @expense_categories = ExpenseCategory.fetch_user_expense_categories_with_nil(@user_category.id)
    @expense_sub_categories = { }
    @expense_categories.each do |expense_category|
      @expense_sub_categories[expense_category.id] = ExpenseSubCategory.fetch_expense_sub_categories_with_nil( @user_category.id, expense_category.id ).pluck(:name).join(', ')
    end
  end

  def new
  end

  def create    
    @expense_category = @user_category.expense_categories.create(expense_category_params)

    if @expense_category.save
      redirect_to user_category_expense_category_path(@user_category,@expense_category), notice: "Successfully created Expense Category."
    else
      render :new, status: :unprocessable_entity, alert: "Unable to create Expense Category.Try Again..."
    end
  end

  def show
    @expense_sub_categories = ExpenseSubCategory.fetch_expense_sub_categories_with_nil( @user_category.id, @expense_category.id )
  end
  
  def edit
  end

  def update
    if @expense_category.update(expense_category_params)
      redirect_to user_category_expense_category_path(@user_category,@expense_category), notice: "Successfully update the Expense Category."
    else
      redirect_to :edit, status: :unprocessable_entity, alert: "Unable to update Expense Category.Try Again..."
    end
  end

  def destroy
    if @expense_category.update(show: false) && @expense_category.sub_categories.update(show: false)
      redirect_to user_category_expense_categories_path(@user_category), notice: "Successfully delete the category."
    else
      redirect_to category_expense_categories_path(@user_category), notice: "Unable to delete the category.try Again...."
    end
  end

  private
  
  def expense_category_params
    params.require(:expense_category).permit(:name)
  end

  def find_user_category
    @user_category = UserCategory.friendly.find_by_slug(params[:user_category_slug])
  end

  def find_expense_category
    @expense_category = ExpenseCategory.friendly.find_by_slug(params[:slug])
  end
end

# ExpenseCategory.all.where(user_category_id:[@user_categories.ids,nil]).group_by(&:user_category_id)
# User.first.expense_categories.where(show:true).group_by(&:user_category)
# ExpenseCategory.all.where(user_category_id:[cate,nil]).where(show:true).group_by(&:user_category)