class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @rooms = Room.all
    if User.exists?(params[:id]) == false
      flash[:notice] = "User does not exist"
    end
    @joined = UserRoom.where(user_id: params[:id])
    @finaljoin = ""
    @joined.each do |join|
      if @rooms.exists?(join.room_id)
        if @finaljoin != ""
          @finaljoin = @finaljoin + ", " + @rooms.find(join.room_id).name
        else
          @finaljoin = @rooms.find(join.room_id).name
        end
      end
    end
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
      @user = User.find(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :age, :location, :hobbies, :about_me, :avatar)
    end
end
