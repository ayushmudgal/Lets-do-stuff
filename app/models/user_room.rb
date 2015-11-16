# == Schema Information
#
# Table name: user_rooms
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  room_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class UserRoom < ActiveRecord::Base
    belongs_to :room
    belongs_to :user
    belongs_to :category
end
