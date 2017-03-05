require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chef_name: 'chef', email: 'chef@wrecipes.com',
                    password: "chef1", password_confirmation: "chef1")
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
    assert_select 'a[href=?]', edit_recipe_path(@recipe), text: "Edit this recipe"
    assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete this recipe"
    assert_select 'a[href=?]', recipe_path(@recipe), text: "Return to recipes listing"
  end
  
  test "create new valid recipe" do
    get new_recipe_path
    assert_template 'recipes/new'
    name_of_recipe = "italian"
    description_of_recipe = "vegies"
    assert_difference 'Recipe.count', 1 do
      post recipes_path, params: {recipe: { recipe_name: name_of_recipe, description: description_of_recipe} }
    end
    follow_redirect!
    assert_match name_of_recipe.capitalize, response.body
    assert_match description_of_recipe, response.body
  end
    
  test "reject invalid recipe submissions" do
    get new_recipe_path
    assert_template 'recipes/new'
    assert_no_difference 'Recipe.count' do
      post recipes_path, params: { recipe: {recipe_name: " ", description: " "} }
    end
    assert_template 'recipes/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
    
  end
    
end
