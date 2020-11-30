class BookmarksController < ApplicationController
  before_action :set_item, except: [:index]
  before_action :authenticate_user!

  def index
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:item_id)
    @bookmarks = Item.find(bookmarks)
  end

  def create
    if @item.user_id != current_user.id
      bookmark = Bookmark.create(user_id: current_user.id, item_id: @item.id)
    end
  end

  def destroy
    bookmark = Bookmark.find_by(user_id: current_user.id, item_id: @item.id)
    bookmark.destroy
  end

  def bookmarks
    @items = current_user.bookmark_items.includes(:user).with_attached_images.recent
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
