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

class Message < ActiveRecord::Base
    belongs_to :room
    belongs_to :user
end
