require 'rails_helper'

#UsersController includes:

	#GET #show

RSpec.describe UsersController, :type => :controller do
	
	describe "GET #show" do
		login_user
		it 'renders the user profile page for the current user' do
			get :show, id: subject.current_user.id
			response.should render_template :show
		end

		it 'renders the user profile page for any existing users' do
			another_user = FactoryGirl.create(:user, password: "31232121312")
			get :show, id: another_user.id
			response.should render_template :show
		end

		it 'raises error when the id given is invalid' do
			expect{get :show, id: -1}.to raise_error(ActiveRecord::RecordNotFound)
		end
	end

end