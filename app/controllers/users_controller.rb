class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @tracked_friends = current_user.friends
  end

  def search
    if params[:key_search].present?
      @friends = User.search(params[:key_search])
      @friends = current_user.except_current_user(@friends)
      if @friends
        respond_to do |format|
          format.js { render partial: 'users/friend_result'}
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          format.js { render partial: 'users/friend_result'}
        end
      end
    else
      respond_to do |format|
          flash.now[:alert] = "Please enter name or email to search"
          format.js { render partial: 'users/friend_result'}
        end
    end
  end

end
