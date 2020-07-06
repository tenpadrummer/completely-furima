class Item < ApplicationRecord

  belongs_to :user

  validates_presence_of :name, :price, :description
  validates :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id, presence: true, numericality: { other_than: 0 }
  validates :price, inclusion: { in: 300..9999999 }
end
