class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :sum_price, only: [:show]


  def show
    @user_info = @user.user_info
    @sell_item = @user.items.find_by(user_id: current_user.id)
    if @user.item_purchase.exists?
      purchase_item = @user.item_purchase.find_by(user_id: current_user)
      @latest_item = purchase_item.item
    end
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

  def sum_price
    @item_ids = ItemPurchase.where.not(user_id: current_user.id).pluck(:item_id)
    @got_items = Item.find(@item_ids)
    @sum_price = @got_items.pluck(:price).sum
  end
end
