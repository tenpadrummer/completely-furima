class CommentsController < ApplicationController

  before_action :set_item

  def create
    @comment = @item.comments.new(comment_params)
    @comment.save!
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
