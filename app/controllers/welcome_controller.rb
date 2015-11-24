class WelcomeController < ApplicationController
  def index
    @categories = Category.all
	end
end
