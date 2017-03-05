require 'test_helper'

class RecipeTest <ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create!(chef_name: "tester1", email: "tester1@wrecipes.com",
                    password: "chef1", password_confirmation: "chef1")
    @recipe = @chef.recipes.build(recipe_name: "Vegetable", description: "Great vestable recipe" )
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "recipe without chef should be invalid?" do
    @recipe.chef_id =nil
    assert_not @recipe.valid?
  end
  
  test "recipe_name should be present" do
    @recipe.recipe_name = " "
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description should not be less than 3 characters" do 
    @recipe.description = "a" * 2
    assert_not @recipe.valid?
  end
   
  test "description should not be more than 500 characters" do 
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
   
end