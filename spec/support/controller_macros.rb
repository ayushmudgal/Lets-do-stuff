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

end