class CommentsController < ApplicationController
  before_action :set_item

  def create
    @comment = @item.comments.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment.content, time: @comment.created_at.strftime('%F, %I:%M%#p'), user_name: @comment.user.nickname
      # broadcastとはサーバーから送られるデータの経路のこと。broadcastを介してデータをクライアントに送信。
      # ここではbroadcastを使用し'comment_channel'に向けて@commentを送信
      # 送信された情報は、comment_channel.jsで受け取る
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
