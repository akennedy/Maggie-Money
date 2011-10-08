class CustomPagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home]

  def home
  end

  def dashboard
    @transactions = current_user.transactions.order("created_at DESC").limit(25)
  end

  def mcfp
  end
end
