class ChefsController < ApplicationController
  
  def new
    @chef = Chef.new
  end
  
  def create
    #debugger
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Welcome #{ @chef.chef_name } to World of Recipes App!"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end
  
  def show
    @chef = Chef.find(params[:id])
  end
  
  
  
  private
    
    def chef_params
      params.require(:chef).permit(:chef_name, :email, :password, :password_confirmation)
    end
    
end
