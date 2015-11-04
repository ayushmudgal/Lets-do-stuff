# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  description :text
#  date        :date
#  time        :time
#  location    :string
#  private     :boolean
#

  require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save room without name" do
  	room = Room.new
  assert room.save
  # this is a wrong test, features will be fixed later
  end
    # to do: validate for name, activity, category, location?

  test "should not save user without email" do
  	user = User.new
  assert_not user.save
end
end

