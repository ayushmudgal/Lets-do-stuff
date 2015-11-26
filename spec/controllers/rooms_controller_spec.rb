require 'rails_helper'


RSpec.describe RoomsController, :type => :controller do
	let(:user) {create(:user, email: "ayushincnca@gmail.com", password: "hellohello")}
	before { controller.stub(:current_user) { user } }

	describe "ROOM #create" do
		it 'let the current user to make new post with valid post data' do
			create(:category, id:1)
			@room = FactoryGirl.attributes_for(:room)
			expect{
				post :create, room: @room, commit: "Create Room"
			}.to change(Room, :count).by(1)

			response.should redirect_to "/rooms/" + Room.last.id.to_s 
		end

	describe "GET #show" do
		it 'renders the post page for the selected post' do
			create(:category, id:1)
			room = create(:room, location: "90004")
			get :show, id:room.id
			response.should render_template 'show'
		end
	end

	describe "GET #new" do
		login_user
		it 'redirect to the create new room page' do
			get :new
			response.should render_template 'new'
		end
	end

	describe "GET #index" do
		login_user
		it 'shows all rooms' do
			get :index
			response.should redirect_to "/"
		end
	end

	describe "DELETE #destroy" do
		it 'deletes the selected room' do
			create(:category, id:1)
			@room = create(:room, location: "90004")
			expect{
				delete :destroy, id: @room.id
			}.to change(Room, :count).from(Room.count).to(Room.count - 1)
			response.should redirect_to categories_path + "/" + @room.category_id.to_s
			expect{Room.find(@room.id)}.to raise_error(ActiveRecord::RecordNotFound)
		end
	end

 	end

end