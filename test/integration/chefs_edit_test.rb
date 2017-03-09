require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chef_name: 'chef1', email: 'chef1@wrecipes.com',
                    password: "chef1", password_confirmation: "chef1")
    @chef2 = Chef.create!(chef_name: 'chef2', email: 'chef2@wrecipes.com',
                    password: "chef2", password_confirmation: "chef2")
    @adminchef = Chef.create!(chef_name: 'Adminchef', email: 'adminchef@wrecipes.com',
                    password: "adminchef", password_confirmation: "adminchef", admin: true)
#    @recipe = Recipe.create(recipe_name: "Chicken saute", description: "cook chiken", chef: @chef)
#    @recipe2 = Recipe.create(recipe_name: "Vegies saute", description: "cook vegies", chef: @chef)
  end

  test "should reject an invalid edit" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: " ", email: "chef@wrecipes.com", password: "chef1", password_confirmation: "chef1" } }
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "should accept a valid edit" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: "chef1", email: "chef1@wrecipes.com" } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "chef1", @chef.chef_name
    assert_match "chef1@wrecipes.com", @chef.email
  end
  
  test "should accept edit attempt by admin user" do
    sign_in_as(@adminchef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: "chef3", email: "chef3@wrecipes.com" } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "chef3", @chef.chef_name
    assert_match "chef3@wrecipes.com", @chef.email
  end
  
  test "should redirect edit attempt by non-admin user" do
    sign_in_as(@chef2, "password")
    updated_name = "Joe"
    updated_email = "joe@wrecipes.com"
    patch chef_path(@chef), params: { chef: { chef_name: updated_name, email: updated_email } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "chef1", @chef.chef_name
    assert_match "chef1@wrecipes.com", @chef.email
  end
 
end
