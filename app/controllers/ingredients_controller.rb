class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
#  before_action :require_user, except: [:index, :show]
#  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, except: [:show, :index]
  
  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = " Ingredient was created successfully! "
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end
  
  def edit

  end
  
  def update
    if @ingredient.update(ingredient_params)
      flash[:success] = "Ingredient was updated successfully!"
      redirect_to ingredient_path(@ingredient)
    else
      render 'edit'
    end
  end
  
  def destroy
    Ingredient.find(params[:id]).destroy
    flash[:success] = "Ingredient deleted successfully"
    redirect_to ingredients_path
  end
  
  
  private
    
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
  
    def ingredient_params
      params.require(:ingredient).permit(:name, :description, :category, :substitute)
    end
    
#   def require_same_user
#     if !current_chef.admin?
#        flash[:danger] = "This action is not allowed"
#        redirect_to ingredients_path
#     end
#    end
    
    def require_admin
      if !logged_in? || (logged_in? and !current_chef.admin?)
        flash[:danger] = "You are not allowed to perform this action"
        redirect_to ingredients_path
      end
    end
    
end