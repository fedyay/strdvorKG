class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def admin_user
    unless current_user.admin?
      flash[:danger] = "You don't have enough permissions"
      redirect_to root_url
    end
  end
end
