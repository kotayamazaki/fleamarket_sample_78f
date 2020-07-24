# ルート
crumb :root do
  link "トップページ", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root, root_path
end

# 住所登録
crumb :address do
  link "住所登録", new_address_path
  parent :mypage, users_path
end

#クレジットカード登録
crumb :new_card do
  link "クレジットカード登録", new_card_path
  parent :mypage, users_path
end
