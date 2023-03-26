module ApplicationHelper
  def user_categories
    current_user.categories if user_signed_in?
  end
end

