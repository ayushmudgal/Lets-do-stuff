require 'rails_helper'

#UsersController includes:

	#GET #show

RSpec.describe CategoriesController, :type => :controller do
	let(:current_user) {create(:user, email: "ayushincnca@gmail.com", password: "hellohello", location:nil)}
	let(:category_params) {name}

	describe "Categories #create" do
		it 'create a new category' do
			@category = FactoryGirl.attributes_for(:category)
			expect{
				post :create, category: @category, commit: "Create Category"
			}.to change(Category, :count).by(1)

		end
	end

	describe "GET #show" do
		login_user
		it 'renders the category' do
			create(:category, id:1)
			category = create(:category, name: "Sports")
			get :show, id:category.id
			response.should render_template 'show'
		end

		it 'renders the category' do
			create(:category, id:1)
			category = create(:category, name: "Sports")
			get :show, id:category.id
			response.should render_template 'show'
		end
	end

	describe "GET #new" do
		login_user
		it 'redirect to the create new category page' do
			get :new
			response.should render_template 'new'
		end
	end

	describe "DELETE #destroy" do
		login_user
		it 'deletes the selected room' do
			@category = create(:category, name: "Sports")
			expect{
				delete :destroy, id: @category.id
			}.to change(Category, :count).from(Category.count).to(Category.count - 1)
			expect{Category.find(@category.id)}.to raise_error(ActiveRecord::RecordNotFound)
		end
	end

end
	