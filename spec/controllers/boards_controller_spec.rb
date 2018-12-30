require 'spec_helper'
RSpec.describe BoardsController do

  before(:each) do
    @user = FactoryBot.create(:user)
    @board = @user.boards.first
    login(@user)
  end

  after(:each) do
    if !@user.destroyed?
      @user.pins.destroy_all
      @user.pinnings.destroy_all
      @user.boards.destroy_all
      @user.destroy
    end
  end

  describe "GET new" do
    it 'responds with successfully' do

    end

    it 'renders the new view' do

    end

    it 'assigns an instance variable to a new board' do

    end

    it 'redirects to the login page if user is not logged in' do

    end
  end

  describe "POST create" do
    before(:each) do
      @board_hash = {
        name: "My Pins!"
      }
    end

    after(:each) do
      board = Board.find_by_name("My Pins!")
      if !board.nil?
        board.destroy
      end
    end

    it 'responds with a redirect' do

    end

    it 'creates a board' do

    end

    it 'redirects to the show view' do

    end

    it 'redisplays new form on error' do
      # The name is required in the Board model, so we'll make the name nil to test what happens with invalid parameters
      @board_hash[:name] = nil

    end

    it 'redirects to the login page if user is not logged in' do

    end
  end

  describe "GET #show" do
    it "assigns the requested board" do

    end

    it "assigns the @pins variable with the board's pins" do

    end
  end

# last end
end
