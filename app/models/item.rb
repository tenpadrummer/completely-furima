class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_one_attached :image

  belongs_to :user
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :category

  validates_presence_of :name, :image, :price, :description
  validates :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id, presence: true, numericality: { other_than: 0 }
  validates :price, inclusion: { in: 300..9999999 }
end
