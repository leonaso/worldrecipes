class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    chef = Chef.find_by(email: params[:session][:email].downcase)
    if chef && chef.authenticate(params[:session][:password])
      # store an encrypted chef_id in session hash
      session[:chef_id] = chef.id
      flash[:success] = "You have successfully logged in"
      redirect_to chef_path(chef)
    else
      flash.now[:danger] = "Try again, wrong credentials"
      render 'new'
    end
  end
  
  def destroy
    # destroy session by setting its id to nil
    session[:chef_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
  
end