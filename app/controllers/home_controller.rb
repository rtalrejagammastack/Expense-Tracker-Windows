class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_pages_path
    end
  end
end
