class CustomPagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home]

  def home
  end

  def dashboard
  end

end