module ControllerMacros
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user, password: "12312321")
			sign_in @user
		end
	end

	def create_second_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user2 = FactoryGirl.create(:user2)
		end
	end

	def create_third_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user3 = FactoryGirl.create(:user3)
		end
	end

	def create_fourth_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user4 = FactoryGirl.create(:user4)
		end
	end

	def login_second_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			sign_in @user2
		end
	end

	def login_third_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			sign_in @user3
		end
	end

	def devise_setup
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
		end
	end

	def user_signup
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
		end
	end

	def create_post
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
			request.env["HTTP_REFERER"] = "http://test.host/posts"
		end
	end

	def create_post_logout
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
			sign_out @user
		end
	end

	def create_posts
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
			@post2 = FactoryGirl.create(:post, title: "Book Title", description: "Book Description", category: "Books", :user_id => @user.id)
			@post3 = FactoryGirl.create(:post, title: "This is a furniture", description: "A pretty good furniture", category: "Furniture", :user_id => @user.id)
			@post4 = FactoryGirl.create(:post, title: "169 test service", description: "I can write tests for your project!", category: "Service", price: "$$$", :user_id => @user.id)
			@post5 = FactoryGirl.create(:post, title: "Capybara", description: "This is not a real capybara, but a 169 capybara.", category: "Other", price: "$", :user_id => @user.id)
		end
	end

	def create_comment
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
			@comment = FactoryGirl.create(:comment, :post_id => @post.id, :user_id => @user.id)
		end
	end

	def create_comment_logout
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			sign_in @user
			@post = FactoryGirl.create(:post, :user_id => @user.id)
			@comment = FactoryGirl.create(:comment, :post_id => @post.id, :user_id => @user.id)
			sign_out @user
		end
	end

	def send_message_from_1_to_2_and_3
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@user = FactoryGirl.create(:user)
			@user2 = FactoryGirl.create(:user2)
			@user3 = FactoryGirl.create(:user3)
			sign_in @user
			@message = @user.send_message([@user2, @user3], "This is the body of the message", "This is a subject").conversation
			sign_out @user
		end
	end
end