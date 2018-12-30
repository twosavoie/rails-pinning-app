class PinsController < ApplicationController
  before_action :require_login, except: [:show, :show_by_name]

  def index
    @pins = Pin.all
#    @pins = current_user.pins - changed after adding repinning ability
  end

  def show
    @pin = Pin.find(params[:id])
    @users = @pin.users
  end

  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    @users = @pin.users
    render :show
  end

  def new
    @pin = Pin.new
    @pin.pinnings.build
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.valid?
      @pin.save
      redirect_to "/pins/#{@pin.id}"
    else
      @errors = @pin.errors
      render :new
    end
  end

  def edit
    @pin = Pin.find(params[:id])
#    render :edit
  end

  def update
    @pin = Pin.find(params[:id])
    @pin.update(pin_params) #update_attributes dep in R6
    if @pin.valid?
      @pin.save
      redirect_to "/pins/#{@pin.id}"
    else
      @errors = @pin.errors
      render :edit
    end
  end

  def repin
    @pin = Pin.find(params[:id])
    @board = Board.find(params[:pin][:pinning][:board_id])
    Pinning.create(user_id: current_user.id, board_id: @board.id, pin_id: @pin.id)
    redirect_to user_path(current_user)
  end 

  private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id, :board_id, pinnings_attributes: [:board_id, :user_id, :id])
  end

end
