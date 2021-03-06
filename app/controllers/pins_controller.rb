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
    @pin.pinnings.create(user: current_user, board: chosen_board)
    redirect_to user_path(current_user) # redirect_to board_path?
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  # Must @pin = Pin.find(params[:id]) because I did not set the pin in private
  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id, :board_id, pinnings_attributes: [:board_id, :user_id, :id])
  end

end
