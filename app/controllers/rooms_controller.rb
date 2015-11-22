class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    # @rooms = Room.all
    # @rooms = @rooms.paginate(:page => params[:page], :per_page => 5)
    require 'will_paginate/array'
    require 'rails/all'
    @rooms = Room.paginate(:page => params[:page], :per_page => 5)
    # helper.will_paginate(@rooms)
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @messages = Message.where(room_id: params[:id])
    @toback = @room.category_id
    @joinedUsers= UserRoom.where(room_id: params[:id])
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.creator_id = current_user.id

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    category = Category.find(@room.category_id)
    @room.destroy
    respond_to do |format|
      format.html { redirect_to category, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    if UserRoom.exists?(user_id: current_user.id, room_id: params[:id], category_id: Room.find(params[:id]).category_id)
      flash[:notice] = "You already joined the room!"
    else
      UserRoom.create(user_id: current_user.id, room_id: params[:id], category_id: Room.find(params[:id]).category_id)
      flash[:notice] = "You successfully joined the room!"
    end
    redirect_to room_path
  end

  def quit
    if UserRoom.exists?(user_id: current_user.id, room_id: params[:id])
      @currentUserRoom = UserRoom.where(user_id: current_user.id, room_id: params[:id])
      UserRoom.delete(@currentUserRoom)
       # UserRoom.find(:user_id => ["user_id = ? and room_id - ?"], params[:current_user.id], params[params[:id]).destroy
      flash[:notice] = "You have left the room!"
    end
    # redirect_to room_path
    redirect_to room_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :location, :category_id, :description, :date, :time, :location, :private, :category)
    end
end
