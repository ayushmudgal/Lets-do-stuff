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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing_:style.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  has_many :messages, dependent: :destroy
  has_many :user_rooms
  validates :age, :inclusion => { :in => 0..99, :message => "The age should be within range of 0 ~ 99",:allow_nil => true}

  # validates_zipcode :location
  # validates :location, format:{
  #     with: /\A\d{5}(-\d{4})?\z/
  # }

  include Amistad::FriendModel
  #### HAVE TO ADD AMISTAD
end
