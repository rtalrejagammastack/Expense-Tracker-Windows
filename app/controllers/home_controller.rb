# frozen_string_literal: true

# Home Categories Operation
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end
end
