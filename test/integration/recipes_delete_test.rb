require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chef_name: 'chef', email: 'chef@wrecipes.com',
                    password: "chef1", password_confirmation: "chef1")
    @recipe = Recipe.create(recipe_name: "Vegies saute", description: "cook vegies", chef: @chef)
  end

  test "should succesfully delete a recipe" do
    sign_in_as(@chef, "password")
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete this recipe"
    assert_difference 'Recipe.count', -1 do
      delete recipe_path(@recipe)
    end
    assert_redirected_to recipes_path
    assert_not flash.empty?
  end
end
