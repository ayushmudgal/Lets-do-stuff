class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :require_user, only: [:edit]
  before_filter :admin, only: [:index]
  before_action :authenticate_user!
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @rooms = Room.all
    @isfriend = @user.friend_with? current_user
    @joined = UserRoom.where(user_id: params[:id])
    @friends = @user.friends
    @created = Room.where(creator_id: params[:id])
    # Room.joins("LEFT OUTER JOIN user_rooms ON user_rooms.room_id = rooms.id")
    # Room.joins(:room).where('user_rooms.room_id = rooms.id')
    # User.includes(:vehicles).where(vehicles: { type: 'auto' })
    # @rooms = Room.where(id: UserRoom.where(user_id: current_user.id))
  end
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if User.exists?(params[:id])
        @user = User.find(params[:id])
      else
        flash[:notice] = "User does not exist"
        @user = User.last
      end
    end

    def require_user
      @user_accessing = current_user
      if current_user.id != @user.id
        flash[:notice] = "Sorry, you are not authorized to access to this page!"
        redirect_to root_path
      end
    end

    def admin
      flash[:notice] = "Sorry, you are not authorized to access to this page!"
      redirect_to root_path
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :age, :location, :hobbies, :about_me, :avatar)
    end
end
