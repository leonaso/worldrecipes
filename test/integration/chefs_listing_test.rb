require 'test_helper'

class ChefsListingTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chef_name: 'chef1', email: 'chef1@wrecipes.com',
                    password: "chef1", password_confirmation: "chef1")
    @chef2 = Chef.create!(chef_name: 'chef2', email: 'chef2@wrecipes.com',
                    password: "chef2", password_confirmation: "chef2")
  end
  
  test "should get chefs listing" do
    get chefs_path
    assert_template 'chefs/index'
    assert_select "a[href=?]", chef_path(@chef), text: @chef.chef_name.capitalize
    assert_select "a[href=?]", chef_path(@chef2), text: @chef2.chef_name.capitalize
  end
  
  test "should delete chef" do
    sign_in_as(@chef2, "password")
    get chefs_path
    assert_template 'chefs/index'
    assert_difference 'Chef.count', -1 do
      delete chef_path(@chef2)
    end
    assert_redirected_to chefs_path
    assert_not flash.empty?
  end
  
end
