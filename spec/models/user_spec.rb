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

require 'spec_helper'

describe User do
	describe 'instantiation' do
    	let!(:user) { build(:user) }

    it 'instantiates a user' do
      	expect(user.class.name).to eq("User")
    end

    it "create invalid sign_in_count" do
    	FactoryGirl.build(:user, sign_in_count: "").should_not be_valid
  	end

    it "create valid user" do
    	FactoryGirl.build(:user).should be_valid
  	end

  	it "create invalid user hobby" do
    	FactoryGirl.build(:user, hobbies:1).should_not be_valid
  	end

  	it "invalid empty password" do
    	FactoryGirl.build(:user, password: "").should_not be_valid
  	end

  	it "email already exists" do
	    email = "ayyy@lmao.edu"
	  	FactoryGirl.create(:user, email: email)
	  	FactoryGirl.build(:user, email: email).should_not be_valid
  	end


  end
end
