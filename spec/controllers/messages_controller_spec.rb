require 'rails_helper'


RSpec.describe MessagesController, :type => :controller do
    describe "Messages #create" do
        it 'create a new message' do
            @message = FactoryGirl.attributes_for(:message)
            expect{
                post :create, message: @message, commit: "Create Message", format: :js
            }.to change(Message, :count).by(1)
        end
    end
    
end
