require "test_helper"

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chef_name: "Chef1", email: "chef1@wrecipes.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef_name should be present" do
    @chef.chef_name = " "
    assert_not @chef.valid?
  end
  
  test "chef_name should be less than 30 characters" do 
    @chef.chef_name = "a" * 31
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email should be less than 255 characters" do 
    @chef.email = "a" * 244 + "@wrecipes.com"
    assert_not @chef.valid?
  end

  test "email should accept valid format" do
    valid_emails = %w[user@example.com MAss@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valids|
      @chef.email = valids
      assert @chef.valid?, "#{valids.inspect} should be valid"
    end
  end

  test "email should not accept invalid format" do
    invalid_emails = %w[user@example MAss@gmail,com M.first@yahoo. john+smith@co+uk.org]
    invalid_emails.each do |invalids|
      @chef.email = invalids
      assert_not @chef.valid?, "#{invalids.inspect} should be invalid"
    end
  end
  
  test "email should be unique and case insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end
  
  test "email should be lower case before saving to db" do
    mixed_email = "JhoN@Example.coM"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
  end
end
