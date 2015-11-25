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

require 'faker'

FactoryGirl.define do
  factory :room do |f|
    f.name {Faker::Internet.user_name}
    f.location {Faker::Internet.name}
    f.category_id 3
    f.description "Happy Room"
    f.date {Faker::Date.forward(23)}
    f.time {Faker::Date.forward(23)}

    f.private true
  end
end
