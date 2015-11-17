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

require 'rails_helper'
require 'pry'

describe User do
	describe 'instantiation' do
    	let!(:user) { 
        build(:user) 
      }

    it "instantiates a user" do
      	expect(user.class.name).to eq("User")
    end

    it "create invalid sign_in_count" do
    	build(:user, sign_in_count: "").should_not be_valid
  	end

  	it "create invalid user hobby" do
    	build(:user, hobbies:1).should_not be_valid
  	end

  	it "invalid empty password" do
    	build(:user, password: "").should_not be_valid
  	end

  	it "email already exists" do
	    email = "ayyy@lmao.edu"
	  	create(:user, email: email, password: "hellohello")
	  	build(:user, email: email, password: "hellohello").should_not be_valid
  	end


  end
end
