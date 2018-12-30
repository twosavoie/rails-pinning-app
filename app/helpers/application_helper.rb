module ApplicationHelper

  def current_user
    @user ||= User.where("id=?",session[:user_id]).first
  end

  def chosen_board
    @board ||= Board.find(params[:pin][:pinning][:board_id])
  end

  def logged_in?
    !current_user.nil? && !current_user.id.nil?
  end


end
