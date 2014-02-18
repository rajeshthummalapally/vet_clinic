require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users 
 
  test "should validate if role is among list of allowed roles" do
    user = users(:admin)
    assert user.valid? #just make sure user is valid before we make changes

    user.role = "no_role"
    assert !user.valid?
  end

  test "should validate if name is less than 35 characters" do
    user = users(:admin)
    user.name = "Test user name more than thirty five characters"

    assert !user.valid?

    user.name = "Jim"
    assert user.valid?
  end

  test "should not be valid if years in practice is more than 100 years" do
    user = users(:admin)

    user.years_in_practice = 105

    assert !user.valid?
  end

  test "should validate if years in practice is less than 100 years" do
    user = users(:admin)

    user.years_in_practice = 45
    assert user.valid?
  end
end
