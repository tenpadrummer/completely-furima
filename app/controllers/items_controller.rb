class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create, :tag_search]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item_tag = TagForm.new(item_params)
    if @item_tag.valid?
      @item_tag.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if current_user.id == @item.user_id
      @item.update(item_params)
      return redirect_to item_path if @item.valid?
    else
      flash[:notice] = '編集に失敗しました'
      render 'edit'
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_url
    else
      flash[:notice] = '削除に失敗しました'
      render 'show'
    end
  end

  def tag_search
    return nil if params[:input] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:input]}%"] ) #tag_nameであいまい検索
    render json:{ keyword: tag } #「keyword」というキーに対応するバリューとしてtagをセット、JSONで返します。
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
