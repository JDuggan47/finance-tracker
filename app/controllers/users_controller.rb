class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @user_stocks = @user.stocks
  end

  def my_friends
    @friendships = current_user.friends
  end

  def search
    if params[:search_param].blank?
      flash.now[:danger] = "You Have Entered an Empty Search!"
    else
      @users = User.search(params[:search_param])
      @users = current_user.except_current_user(@users)
      flash.now[:danger] = "No Users Match This Search Criteria!" if @users.blank?
    end
    respond_to do |format|
      format.js { render partial: 'friends/result' }
    end
  end

  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end
end
