require 'test_helper'

class ChefsShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chef_name: 'chef1', email: 'chef@wrecipes.com',
                    password: "chef1", password_confirmation: "chef1")
    @recipe = Recipe.create(recipe_name: "Chicken saute", description: "cook chiken", chef: @chef)
    @recipe2 = Recipe.create(recipe_name: "Vegies saute", description: "cook vegies", chef: @chef)
  end

  test "should get chefs show page" do
    get chef_path(@chef)
    assert_template 'chefs/show'
    assert_select "a[href=?]", recipe_path(@recipe),text: @recipe.recipe_name
    #assert_select "a[href=?]", recipe_path(@recipe2),text: @recipe2.recipe_name
    assert_match @recipe.description, response.body
    assert_match @chef.chef_name, response.body
  end
  
end
