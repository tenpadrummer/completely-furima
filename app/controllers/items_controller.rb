class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create, :tag_search, :item_search]
  before_action :search_item, only: [:index, :show, :item_search]
  before_action :set_category, only: [:index, :show, :item_search]
  before_action :set_brand, only: [:index, :show, :item_search]

  def index
    @items = Item.all.order(created_at: :desc)
    @ladies = Item.where(category_id: 1)
    @mens = Item.where(category_id: 2)
    @sports = Item.where(category_id: 9)
    @hobbies = Item.where(category_id: 6)
  end

  def show
    @comment = Comment.new
    @comments = @item.comments
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
    @results = @i.result # @iに対して「.result」とすることで、検索結果を取得
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @i = Item.ransack(params[:q])
    # キー（:q）を使用し、itemsテーブルから商品情報を探す。
    # そして、「@i」という名前の検索オブジェクトを生成。
  end
end
