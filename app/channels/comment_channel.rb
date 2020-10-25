class CommentChannel < ApplicationCable::Channel
  # サーバーとクライアントを繋ぐファイル。MVCでいうところのルーティングの機能。
  def subscribed
    stream_from 'comment_channel' # サーバーとクライアントを関連付けるメソッド
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
