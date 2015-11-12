# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#  room_id    :integer
#  user_id    :integer
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
