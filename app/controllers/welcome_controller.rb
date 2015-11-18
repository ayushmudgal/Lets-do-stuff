class WelcomeController < ApplicationController
  def index
    @categories = Category.all
   if current_user.present?
	   if current_user.name == "Name" or current_user.name == nil
	   		@name = ""
	   	else
	   		@name = current_user.name.to_s + "'s Page ~ "
	  	end
	  end
	end
end
