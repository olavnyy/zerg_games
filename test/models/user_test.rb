require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:friendships)
  should have_many(:friends)

  test "no error is raised when trying to access friend list" do
  	assert_nothing_raised do
			users(:jet).friends
  	end
  end

  test "creating user friendships" do
    users(:jet).friends << users(:jack)
    users(:jet).friends.reload
    users(:jet).friends.include?(users(:jack))
  end
end
