# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  age                    :integer
#  location               :string
#  hobbies                :text
#  about_me               :text
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

require 'faker'

FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    encrypted_password {Faker::Internet.password}
  end

  factory :room do |f|
    f.name {Faker::Internet.user_name}
    f.location {Faker::Internet.name}
    f.category_id 3
    f.description "Happy Room"
    f.date {Faker::Date.forward(23)}
    f.time {Faker::Date.forward(23)}
  end
end
