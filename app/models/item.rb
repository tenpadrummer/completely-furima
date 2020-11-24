class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many_attached :images

  belongs_to :user
  has_one :item_purchase, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :category

  validates_presence_of :name, :images, :price, :description
  validates :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id, presence: true, numericality: { other_than: 0 }
  validates :price, inclusion: { in: 300..9_999_999 }
  validates :price, numericality: { with: /\A[0-9]+\z/ }

  def previous
    user.items.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.items.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
