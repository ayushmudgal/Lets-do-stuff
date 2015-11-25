require 'rails_helper'

#UsersController includes:

	#GET #show

RSpec.describe CategoriesController, :type => :controller do
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
	end

end
	