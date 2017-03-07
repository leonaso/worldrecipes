class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # helper to make this methods available to the views
  helper_method :current_chef, :logged_in?
  
  # get the current user from the session otherwise find it from the db.
  def current_chef
    @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  # convert the function "current_chef" to a boolean expression.
  def logged_in?
    !!current_chef
  end
  
  # restrict action to logged in user only
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to permorm this action"
      redirect_to root_path
    end
  end
  
end
