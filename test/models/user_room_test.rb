# == Schema Information
#
# Table name: user_rooms
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  room_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "userroom should have one id" do
  	get user_rooms(:one).id
  	assert_equal(1, user_rooms(:one).id)
  end

  test "userroom should have one user_id" do
  	get user_rooms(:two).user_id
  	assert_equal(3,user_rooms(:two).user_id)
  end

  test "userroom should have one room_id" do
  	get user_rooms(:two).room_id
  	assert_equal(4,user_rooms(:two).room_id)
  end

end
