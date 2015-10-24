# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save room without name" do
  	room = Room.new
  assert room.save
end
end
