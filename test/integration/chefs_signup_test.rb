require 'test_helper'

class ChefsSignupTest < ActionDispatch::IntegrationTest
  
  test "should get signup path" do
    get signup_path
    assert_response :success
  end
  
  test "should reject an invalid signup" do
    get signup_path
    assert_no_difference "Chef.count" do
      post chefs_path, params: { chef: { chef_name: " ", email: " ", password: " ",
                                password_confirmation: " " } }
    end
    assert_template 'chefs/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "should accept a valid signup" do
    get signup_path
    assert_difference "Chef.count", 1 do 
      post chefs_path, params: { chef: { chef_name: "Chef1", email: "chef1@wrecipes.com", 
                                      password: "chef1", password_confirmation: "chef1" } }
    end
    follow_redirect!
    assert_template 'chefs/show'
    assert_not flash.empty?
  end
  
  
end
