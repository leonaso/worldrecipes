require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chef_name: 'chef', email: 'chef@wrecipes.com')
    @recipe = Recipe.create(recipe_name: "Chicken saute", description: "cook chiken", chef: @chef)
    @recipe2 = Recipe.create(recipe_name: "Vegies saute", description: "cook vegies", chef: @chef)
  end

  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.recipe_name, response.body
    assert_match @recipe2.recipe_name, response.body
    assert_select "a[href=?]", recipe_path(@recipe),text: @recipe.recipe_name
    assert_select "a[href=?]", recipe_path(@recipe2),text: @recipe2.recipe_name
  end

  test "should get recipes show" do
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_match @recipe.recipe_name, response.body
    assert_match @recipe.description, response.body
    assert_match @chef.chef_name, response.body
  end
  
    
end
