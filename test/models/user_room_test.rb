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
end
