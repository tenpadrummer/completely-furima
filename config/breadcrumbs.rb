crumb :root do
  link "Home", root_path
end
crumb :login do
  link "ログイン", new_user_session_path
  parent :root
end
crumb :signup do
  link "新規登録", new_user_registration_path
  parent :root
end
crumb :user_info do
  link "ユーザー詳細情報", users_new_user_info_path
  parent :signup
end
crumb :show do
  link "商品詳細", item_path
  parent :root
end
crumb :purchase_show do
  link "商品詳細", item_path(params[:item_id])
  parent :root
end
crumb :new do
  link "商品出品", new_item_path
  parent :root
end
crumb :edit do
  link "商品編集", edit_item_path
  parent :show
end
crumb :purchase do
  link "商品購入", item_item_purchases_path
  parent :purchase_show
end
crumb :search do
  link "商品検索結果", item_search_items_path
  parent :root
end

crumb :bookmark do
  link "お気に入り商品", bookmarks_path
  parent :root
end

crumb :mypage do
  link "マイページ", user_path
  parent :root
end