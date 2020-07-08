class BuyItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number, :user_id, :card_token, :item_id

end
