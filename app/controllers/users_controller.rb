class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_info = @user.user_info
  end
end
