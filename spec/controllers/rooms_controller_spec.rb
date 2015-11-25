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

			# Post.find(@post.id).title.should eq("Test Title")
			# Post.find(@post.id).description.should eq("Test description")
			# Post.find(@post.id).category.should eq("Technology")
			# Post.find(@post.id).price.should eq("$$")

			response.should redirect_to "/rooms/" + Room.last.id.to_s 
		end

	# 	it 'renders the post_new page when missing post title' do
	# 		@post = FactoryGirl.attributes_for(:post, title: "  ")
	# 		expect{
	# 			post :create, post: @post, commit: "Create Post"
	# 		}.to_not change(Post, :count)

	# 		response.should render_template 'new'
	# 	end

	# 	it 'renders the post_new page when missing post description' do
	# 		@post = FactoryGirl.attributes_for(:post, description: "   ")
	# 		expect{
	# 			post :create, post: @post, commit: "Create Post"
	# 		}.to_not change(Post, :count)

	# 		response.should render_template 'new'
	# 	end
	# end

	describe "GET #show" do
		it 'renders the post page for the selected post' do
			create(:category, id:1)
			room = create(:room, location: "90004")
			get :show, id:room.id
			response.should render_template 'show'
		end
	end

	# describe "GET #new" do
	# 	login_user
	# 	it 'redirect to the create new post page' do
	# 		get :new
	# 		response.should render_template 'new'
	# 	end
	# end

	# describe "GET #index" do
	# 	login_user
	# 	it 'shows all posts' do
	# 		get :index
	# 		response.should render_template 'index'
	# 	end
	# end

	# describe "DELETE #destroy" do
	# 	# TODO: add more test cases after we have the association
	# 	create_post
	# 	it 'deletes the selected post' do
	# 		expect{
	# 			delete :destroy, id: @post.id
	# 		}.to change(Post, :count).from(Post.count).to(Post.count - 1)
	# 		response.should redirect_to posts_path
	# 		expect{Post.find(@post.id)}.to raise_error(ActiveRecord::RecordNotFound)
	# 	end

	# 	it 'does not delete post when an invalid id is given' do
	# 		expect{
	# 			delete :destroy, id: -1
	# 		}.to raise_error(ActiveRecord::RecordNotFound)
	# 	end
	# end

	# describe "GET #edit" do
	# 	create_post
	# 	it 'redirects to the update the selected post page' do
	# 		get :edit, id: @post.id
	# 		response.should render_template 'edit'
	# 	end
	# end

	# describe "PUT #update" do
	# 	create_post
	# 	it 'updates the post with valid data' do
	# 		put :update, post: FactoryGirl.attributes_for(:post, title: "New Title", description: "New Description", price: "$"), commit: 'update', id: @post.id
	# 		response.should redirect_to @post
	# 		Post.find(@post.id).title.should eq("New Title")
	# 		Post.find(@post.id).description.should eq("New Description")
	# 		Post.find(@post.id).category.should eq("Technology")
	# 		Post.find(@post.id).price.should eq("$")
	# 	end

	# 	it 'does not update the post with empty fields, and renders edit' do
	# 		put :update, post: FactoryGirl.attributes_for(:post, title: "   ", description: "   ", price: "$"), commit: 'update', id: @post.id
	# 		response.should render_template 'edit'
	# 		Post.find(@post.id).title.should eq("Test Title")
	# 		Post.find(@post.id).description.should eq("Test description")
	# 		Post.find(@post.id).category.should eq("Technology")
	# 		Post.find(@post.id).price.should eq("$$")
	# 	end

	# 	it 'does not update the post with non-exist category, and renders edit' do
	# 		put :update, post: FactoryGirl.attributes_for(:post, category: "Non-exist Category"), commit: 'update', id: @post.id
	# 		response.should render_template 'edit'
	# 		Post.find(@post.id).title.should eq("Test Title")
	# 		Post.find(@post.id).description.should eq("Test description")
	# 		Post.find(@post.id).category.should eq("Technology")
	# 		Post.find(@post.id).price.should eq("$$")
	# 	end

	# 	it 'does not update the post with not valid price, and renders edit' do
	# 		put :update, post: FactoryGirl.attributes_for(:post, price: "$$$$$"), commit: 'update', id: @post.id
	# 		response.should render_template 'edit'
	# 		Post.find(@post.id).title.should eq("Test Title")
	# 		Post.find(@post.id).description.should eq("Test description")
	# 		Post.find(@post.id).category.should eq("Technology")
	# 		Post.find(@post.id).price.should eq("$$")
	# 	end
 	end

end