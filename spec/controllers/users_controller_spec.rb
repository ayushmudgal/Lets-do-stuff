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

	end

	describe "GET #create" do
		login_user
		it 'create a bad new user' do
			@user = FactoryGirl.attributes_for(:user)
			expect{
				post :create, user: @user, commit: "Create User"
			}.to change(User, :count).by(0)

			response.should render_template :new
		end
	end

	describe "DELETE #create" do
		login_user
		it 'delete a bad user' do
			@user = create(:user, password: "123456778")
			expect{
				delete :destroy, id: @user.id
			}.to change(User, :count).from(User.count).to(User.count - 1)
			expect{User.find(@user.id)}.to raise_error(ActiveRecord::RecordNotFound)
		end
	end
end