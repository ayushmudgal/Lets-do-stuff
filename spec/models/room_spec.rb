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

require 'rails_helper'

describe Room do
	describe 'instantiation' do
    	let!(:room) { build(:room) }

    	it 'instantiates a room' do
      	expect(room.class.name).to eq("Room")
      end
      it "create valid room" do    
    		build(:room, name: "happy").should be_valid
  		end	
  		it "create valid date" do    
    		build(:room, date: "2015/11/06").should be_valid
  		end	
  		it "create valid location" do    
    		build(:room, location: "Berkeley").should be_valid
  		end	

  end
end
