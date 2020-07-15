class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if set_item.item_purchase != nil || current_user.id == set_item.user_id
      redirect_to root_url
    end
    @item_purchase = BuyItem.new
  end

  def create
    @item_purchase = BuyItem.new(item_purchase_params)
    if @item_purchase.valid?
      pay
      @item_purchase.save
      redirect_to root_url
    else
      render 'index'
    end
  end

  private

  def item_purchase_params
    params.permit(:postal_code, :prefecture, :city, :address, :building, :phone_number, :item_id, :token
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: item_purchase_params[:token],
      currency:'jpy'
    )
  end
end
