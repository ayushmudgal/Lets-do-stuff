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

class Room < ActiveRecord::Base
    belongs_to :category

    validates :name, presence: true, length: {maximum: 40}   
end
