class BookmarksController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!

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
    @items = current_user.bookmark_items.includes(:user).recent
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
