class FriendShipsController < ApplicationController

  def create
    friend = User.find(params[:friend])
    
    @user_friend = FriendShip.create(user_id: current_user.id, friend_id: friend.id)
    flash[:notice] = "Friend #{friend.full_name} was sucessfully followed"
    redirect_to my_friends_path
  end

  def destroy
    friend = User.find(params[:id])
    user_friend = FriendShip.where(user_id: current_user.id, friend_id: friend.id).first
    user_friend.destroy
    flash[:notice] = "#{friend.full_name} have successfully deleted."
    redirect_to my_friends_path
  end

end
