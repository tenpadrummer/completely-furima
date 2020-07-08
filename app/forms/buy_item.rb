class BuyItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number, :user_id, :card_token, :item_id

  # 郵便番号（「-」を含む且つ7桁
  POSTAL_CODE_REGEX = '/\A\d{3}[-]\d{4}\z/'
  # 電話番号(ハイフンなし11桁)
  PHONE_REGEX = /\A\d{11}\z/

  validates_presence_of :postal_code, :prefecture, :city, :address, :phone_number, :user_id, :card_token, :item_id
  validates_format_of :postal_code, with: /POSTAL_CODE_REGEX/
  validates_numericality_of :prefecture, other_than: 0
  validates :phone_number, format: { with: PHONE_REGEX }, length: { maximum: 11 }
end
