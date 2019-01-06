class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all # Shana @boards = current_user.pinnable_boards
#    @boards = current_user.pinnable_boards
  end

# Haven't figured out yet
  def show_board_by_name
    @board = Board.find_by_name(params[:name])
    @pins = @board.pins
    render :show
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
#    @board = Board.find(params[:id]) #HJR
    @pins = @board.pins # HJR & AA diff
#    @user = @board.user # HJR
#    @pins = @board.pinnings # shows an undefined method "image" for pinning...
  end



  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
#    @board = Board.chosen_board
    @board = chosen_board
    @followers = current_user.user_followers
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:name, :user_id, board_pinners_attributes: [:user_id, :board_id])
    end
end
