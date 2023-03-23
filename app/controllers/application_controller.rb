class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :all_categories

  protected

  def after_sign_in_path_for(resource)
    home_path
  end
  
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
  end

  private

  def all_categories
    if user_signed_in?
      @user = current_user
      @user.categories
    end
  end
end