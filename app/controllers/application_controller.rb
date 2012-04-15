class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def not_authenticated
    redirect_to root_url
    flash[:error] = t('authenticated_html').html_safe
  end
  
  def require_no_user
    if current_user
      flash[:error] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end
  
end
