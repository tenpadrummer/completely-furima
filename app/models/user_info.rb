class UserInfo < ApplicationRecord
  belongs_to :user

  validates_presence_of :postal_code, :city, :addresses, :prefecture_id
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: { with: /\A\d{11}\z/ }, length: { maximum: 11 }
end
