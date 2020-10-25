class BuyItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number, :user_id, :token, :item_id

  # 郵便番号（「-」を含む且つ7桁
  POSTAL_CODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
  # 電話番号(ハイフンなし11桁)
  PHONE_REGEX = /\A\d{11}\z/.freeze

  validates_presence_of :postal_code, :prefecture, :city, :address, :phone_number, :user_id, :token, :item_id
  validates_numericality_of :prefecture, other_than: 0
  validates :postal_code, format: { with: POSTAL_CODE_REGEX }
  validates :phone_number, format: { with: PHONE_REGEX }, length: { maximum: 11 }

  def save
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, item_id: item_id)
    ItemPurchase.create(item_id: item_id, user_id: user_id)
  end
end
