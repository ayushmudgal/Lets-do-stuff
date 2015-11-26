class FriendshipsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_params, only: [:create, :index]

  def index
    @friends = current_user.friends
    @pending_requests = []
    redirect_to user_path
  end

  def new
	@users = User.all
	@users = @users - current_user
	redirect_to get user_room_path 
  end

  def create
    invitee = User.find_by_id(params[:user_id])	
    if current_user.invite invitee
    	redirection = "/user/" + params[:user_id].to_s
      redirect_to redirection, :notice => "Successfully sent friend request!"
    end
  end

  def update
    inviter = User.find_by_id(params[:id])
    if current_user.approve inviter
      	redirect_to user_room_path, :notice => "Successfully added friend!"
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if current_user.remove_friendship user
      redirect_to user_room_path, :notice => "Successfully deleted request!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_params
      if not User.exists?(params[:user_id])
        redirect_to root_path
        flash[:notice] = "User Does not Exist"
    end
  end

end