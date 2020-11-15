class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def show
    @user = User.find(params[:id])
    @user_info = @user.user_info
  end

  def destroy
    if @user == current_user
      @user.destroy
    else
      flash[:notice] = '退会処理に失敗しました'
      render 'show'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
