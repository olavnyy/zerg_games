require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "creating of friendship" do
  	assert_nothing_raised do
  		Friendship.create user: users(:jet), friend: users(:jack)
  	end
	end

	test "create friendship based on user id and friend id" do
		Friendship.create user_id: users(:jet).id, friend_id: users(:jack).id
    users(:jet).friends.reload
		users(:jet).friends.include?(users(:jack))
	end
end
