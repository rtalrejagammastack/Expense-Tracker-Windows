# frozen_string_literal: true

# Home Categories Operation
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transaction.all_transactions(current_user)
  end
end
