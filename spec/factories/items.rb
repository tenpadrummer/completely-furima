FactoryBot.define do
  factory :item do
    name { 'example' }
    price { 10000 }
    description { 'This is the example item' }
    scheduled_delivery_id { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id { 1 }
    sales_status_id { 1 }
    category_id { 1 }
    association :user
  end
end
