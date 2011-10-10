class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = "You are not allowed to access that page"
    redirect_to root_url
  end
end
