class CustomPagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home]

  def home
  end

  def dashboard
  end

  def videos
    authorize! :read, Video
  end

end