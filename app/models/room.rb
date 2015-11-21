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

class Room < ActiveRecord::Base
    belongs_to :category

    validates :name, presence: true, length: {maximum: 40}
    validates :location, presence: true, length: { minimum: 5 }
  	validates :description, presence: true, length: { maximum: 255 }

    has_many :messages, dependent: :destroy
    has_many :user_rooms, dependent: :destroy
end
