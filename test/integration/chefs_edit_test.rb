require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chef_name: 'chef1', email: 'chef1@wrecipes.com',
                    password: "chef1", password_confirmation: "chef1")
#    @recipe = Recipe.create(recipe_name: "Chicken saute", description: "cook chiken", chef: @chef)
#    @recipe2 = Recipe.create(recipe_name: "Vegies saute", description: "cook vegies", chef: @chef)
  end

  test "should reject an invalid edit" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: " ", email: "chef@wrecipe.com", password: "chef1", password_confirmation: "chef1" } }
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "should accept a valid signup" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: "chef1", email: "chef1@wrecipe.com" } }
    #assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "chef1", @chef.chef_name
    assert_match "chef1@wrecipe.com", @chef.email
  end
  
end
