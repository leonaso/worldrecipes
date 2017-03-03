require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef1 = Chef.create!(chef_name: 'chef1', email: 'chef1@wrecipes.com')
    @recipe = Recipe.create(recipe_name: "Chicken saute", description: "cook chiken", chef: @chef1)
    @recipe2 = Recipe.create(recipe_name: "Vegies saute", description: "cook vegies", chef: @chef1)
  end
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.recipe_name, response.body
    assert_match @recipe2.recipe_name, response.body
  end
  
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
end
