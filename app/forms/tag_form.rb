class TagForm
  include ActiveModel::Model
  attr_accessor :name, :price, :description, :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id, :images, :user_id, :item_id, :tag_name

  validates_presence_of :name, :images, :price, :description, :tag_name
  validates :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id, presence: true, numericality: { other_than: 0 }
  validates :price, numericality: { with: /\A[0-9]+\z/, greater_than: 299, less_than:10000000 }

  def save
    item = Item.create(
      name: name,
      price: price,
      description: description,
      scheduled_delivery_id: scheduled_delivery_id,
      shipping_fee_status_id: shipping_fee_status_id,
      prefecture_id: prefecture_id,
      sales_status_id: sales_status_id,
      category_id: category_id,
      images: images,
      user_id: user_id
    )
    tag = Tag.find_by(tag_name: tag_name)
    if tag.blank?
      new_tag = Tag.create(tag_name: tag_name)
      ItemTag.create(item_id: item.id, tag_id: new_tag.id)
    else
      ItemTag.create(item_id: item.id, tag_id: tag.id)
    end
  end
end