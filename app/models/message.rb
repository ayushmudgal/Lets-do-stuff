# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#

class Message < ActiveRecord::Base
    # belongs_to :room
end
