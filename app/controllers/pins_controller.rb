class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    render :show
  end

  def new
    @pin = Pin.new
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


  private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image)
  end

end
