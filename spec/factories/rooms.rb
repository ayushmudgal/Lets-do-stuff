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
require 'faker'

FactoryGirl.define do
  factory :room do
    name {Faker::Internet.user_name}
    location {Faker::Internet.name}
    private true
  end
end
