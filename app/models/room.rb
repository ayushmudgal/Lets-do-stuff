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
#  creator_id  :integer
#  longitude   :float
#  latitude    :float
#

class Room < ActiveRecord::Base
    belongs_to :category
    has_many :messages, dependent: :destroy
    has_many :user_rooms, dependent: :destroy

    validates :name, presence: true, length: {maximum: 40}
    validates :location, presence: true, :length => { :is => 5}
  	validates :description, presence: true, length: { maximum: 255 }
    validates :location, format:{
        with: /\A\d{5}(-\d{4})?\z/
    }

    geocoded_by :location
    after_validation :geocode


end
