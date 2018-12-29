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

# now that I have the permitted correct, retry mjr code.
  def repin # something not right here. The repin goes to users/#. Don't I want it to go to the board I've specified? Why when I'm specifying a board, is it not assigned to that board? When I create a pin and specify a board, it is in the correct board. :)
    @pin = Pin.find(params[:id])
#    @board = Board.find(params[:pin][:pinning][:board_id]) #MJR
#    Pinning.create(user_id: current_user.id, board_id: @board_id, pin_id: @pin.id) #MJR
#    @pins = current_user.pins - changed after adding repinning ability
    @pin.pinnings.create(user: current_user)

#    @pin.save
#    @pin = @pin.pinnings.create(user: current_user)
#    @pin = @pinnings.create(user: current_user) #?
    redirect_to board_path #user_path(current_user) #board_path.(current_user) #user_path(current_user) #repin_path is probably better (no route) maybe board_path
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id, :board_id, pinnings_attributes: [:board_id, :user_id, :id])
  end

end
