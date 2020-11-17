class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def show
    @user_info = @user.user_info
    @sell_item = @user.items.find_by(user_id: current_user.id)
    @purchase_item = @user.item_purchase.find_by(user_id: current_user)
    @latest_item = @purchase_item.item
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
