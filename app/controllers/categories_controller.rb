class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_filter :require_user, only: [:edit]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end


  # GET /categories/1
  # GET /categories/1.json
  def show
    @rooms = Category.find(params[:id]).rooms.page(params[:page]).per(5)
    # @rooms = Room.where(category_id: params[:id]).where("private=? OR creator_id=?", false, current_user.id)
    # joined_rooms = UserRoom.where(user_id: current_user.id).where(category_id: params[:id])
    # joined_rooms.each do |room|
    #   r = Room.where(id: room.room_id)
    #   @rooms = @rooms.concat(r)
    # end
    # @rooms = @rooms.page(params[:page]).per(5)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

     def require_user
      flash[:notice] = "Sorry, you are not authorized to access to this page!"
      redirect_to room_path
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
