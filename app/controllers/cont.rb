ExpenseCategoriesController
# def all
# @expense_categories = ExpenseCategory.fetch_user_expense_categories(@user_categories)

# @user_categories.each do |user_category|
#   @expense_categories[user_category].each do |expense_category|
#     @expense_sub_categories[expense_category&.id] = ExpenseSubCategory.fetch_expense_sub_categories_with_nil(user_category.id, expense_category.id)
#   end
# end

ExpenseCategoriesController
# ExpenseCategory.all.where(user_category_id:[@user_categories.ids,nil]).group_by(&:user_category_id)
# User.first.expense_categories.where(show:true).group_by(&:user_category)
# ExpenseCategory.all.where(user_category_id:[cate,nil]).where(show:true).group_by(&:user_category)

ExpenseCategoriesController
# def main
  # ExpenseCategory.where(user_category_id:[nil,id]).where(show:true).order(:name)
#  @set_hash = set_hash( current_user.categories.ids)

  # @expense_categories = { }
  # byebug
  # @expense_sub_categories = { }
  # @user_categories.each do |user_category|
  #   @expense_categories[user_category.id] =  user_category.fetch_expense_categories

  #   @expense_categories[user_category.id].each do |expense_category|
  #     @expense_sub_categories[expense_category.id] = expense_category.fetch_sub_categories(user_category)
  #   end
# end
# def set_hash(user_category_id)
#   ExpenseCategory.where(user_category_id: user_category_id).where(show:true).order(:name).index_by(&:user_category_id)
# end


ApplicationRecord Model
# DEFAULT_EXPENSE_CATEGORIES = ExpenseCategory.where(user_category_id:nil).pluck(:name)

ExpenseCategory Model
# validate :check_name
# def check_name
#   errors.add(:name, ' already Exists.') if DEFAULT_EXPENSE_CATEGORIES.index(name)
# end
# validates :name, presence: true, uniqueness: { scope: :user_category_id, message: '%< value > already exists' }
# def fetch_sub_categories(user_category)

# end
# def fetch_sub_categories_names(user_category)
#   fetch_sub_categories(user_category).pluck(:name).join(', ')
# def fetch_sub_categories
#   sub_categories.where(user_category_id: [nil, user_category_id]).where(show: true).order(:name)
# end
# end
# scope :nil_fields, -> { where(user_category_id: nil) }

ExpenseSubCategory Model
# validates :name, presence: true, uniqueness: { scope: [:user_id, :category_id], message: "%{value} already exists" }
# validates_uniqueness_of :name, conditions: -> { where.not(show: 'false') }
# validates :name, presence: true, uniqueness: { scope: :category_id, message: ' %<value> already exists' }

UserCategory Model 



# def fetch_expense_categories
#   ExpenseCategory.where(user_category_id:[nil,id]).where(show:true).order(:name)
# end
# scope :load_expense_categories, -> { ExpenseCategory.where("department_id = ?", selected_department) }
# has_many :expense_sub_categories, through: :expense_categories
# validates :name, presence: true, uniqueness: { scope: :user_id, message: "%{value} already exists" }
# scope :fetch_expense_categories,( ids ) -> { ExpenseCategory.where(user_category_id:[nil,ids]).where(show:true).order(:name) }

User Model
# , class_name: 'ExpenseSubCategory', foreign_key: 'user_id', dependent: :destroy

# has_many :expense_categories, -> { where("user_category_id IS NULL OR user_category_id = ?", proxy_association.owner.user_categories.pluck(:id)) },  through: :user_categories

# def expense_categories_with_nil
#   categories.includes(:expense_categories).map do |user_category|
#     {
  #       user_category_id: user_category.id,
  #       expense_categories: user_category.expense_categories.pluck(:name) + ExpenseCategory.nil_fields.pluck(:name)
  #     }
  #   end
  # end
  
  # def expense_categories_with_nil
  #   expenses = categories.map do |user_category|
  #     {
  #       user_category.id => ExpenseCategory.fetch_user_expense_categories_with_nil(user_category.id).pluck(:name)
  #     }
  #   end
  #   expenses.inject(:merge)
  # end

db:seeds
#   ap ExpenseCategory.joins("INNER JOIN user_categories ON user_categories.id = expense_categories.user_category_id").group(:user_category_id).count
# ap ExpenseCategory.joins(:user_category).group("user_category_id").count  
# p ExpenseCategory.where(user_category_id:[nil,1,2])


# User.first.categories.includes(:expense_categories).map do |user_category|
# {
#   user_category_name: user_category.name,
#   expense_categories: user_category.expense_categories.pluck(:name)
# }
# end


# expense_categories = User.first.categories.first.sub_categories
# expense_sub_categories = User.first.sub_catgeories