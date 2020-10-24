import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  // サーバーから送られてきたデータをクライアントの画面に描画するためのファイル
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) { //message_controllerからくる情報をここで受け取り、引数dataにはいる。
    const html = `<div class="comment">
                    <div class="comment_upper-info">
                      <div class="comment_upper-info--user">
                        ${data.user_name}
                      </div>
                      <div class="comment_upper-info--date">
                        ${data.time} 投稿
                      </div>
                    </div>
                    <div class="comment_text">
                      <p>${data.content}</p>
                    </div>
                  </div>
                  <hr />`; // dataの中にあるcontentの中のtextを表示。
    const comments = document.getElementById('comments');
    const input =document.getElementById('comment-form');
    comments.insertAdjacentHTML('afterbegin', html);
    input.reset();
  }
});
