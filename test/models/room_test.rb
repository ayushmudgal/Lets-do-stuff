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

  # test "should not save room without name" do
  # 	room = Room.new
  # assert room.save
  # # this is a wrong test, features will be fixed later
  # end
  #   # to do: validate for name, activity, category, location?

  # test "should not save user without email" do
  # 	user = User.new
  # assert_not user.save
  # end

  # test "room should belong to category" do
  #   get rooms(:Basketball).category
  #   assert_equal(2, rooms(:basketball).category)
  # end
  #
  # # test "room should have id" do
  # #   get rooms(:tennis).id
  # #   assert_equal(2, rooms(:tennis).id)
  # # end
  #
  # test "rooms should have name" do
  #   get rooms(:Boardgames).name
  #   assert_same('Boardgames', rooms(:boardgames).name)
  # end

end
