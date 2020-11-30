class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create, :tag_search, :item_search, :category_search]
  before_action :set_category, only: [:index, :show, :item_search, :category_search]
  before_action :set_brand, only: [:index, :show, :item_search, :category_search]
  before_action :search_item, only: [:index, :show, :item_search, :category_search]
  before_action :search_category, only: [:index, :show, :item_search, :category_search]

  def index
    @items = Item.all.order(created_at: :desc).with_attached_images
    @ladies = Item.where(category_id: 1).with_attached_images
    @mens = Item.where(category_id: 2).with_attached_images
    @sports = Item.where(category_id: 9).with_attached_images
    @hobbies = Item.where(category_id: 6).with_attached_images
  end

  def show
    @category_item = Item.where(category_id: @item.category_id)
    @seller_item = Item.where(user_id: current_user.id)
    @comment = Comment.new
    @comments = @item.comments
    console
  end

  def new
    @item = Item.new
  end

  def create
    @item_tag = TagForm.new(item_params)
    if @item_tag.valid?
      @item_tag.save
      redirect_to root_path
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
    return nil if params[:input] == ''

    tag = Tag.where(['tag_name LIKE ?', "%#{params[:input]}%"]) # tag_nameであいまい検索
    render json: { keyword: tag } # 「keyword」というキーに対応するバリューとしてtagをセット、JSONで返します。
  end

  def item_search
    @item_results = @i.result(distinct: true)
  end

  def category_search
    @category = @c.result
    @category_results = @category.where(category_id: params[:key])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
