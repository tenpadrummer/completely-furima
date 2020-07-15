FactoryBot.define do
  factory :item do
    name { 'example' }
    price { 10_000 }
    description { 'This is the example item' }
    scheduled_delivery_id { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id { 1 }
    sales_status_id { 1 }
    category_id { 1 }
    association :user

    # トレイトを使って、最初からimageが添付されたitemを作成する。
    trait :with_image do
      image { fixture_file_upload Rails.root.join('spec', 'files', 'image.jpg'), 'image/jpg' }
      # fixture_file_uploadはrails_helper.rbに設定が少し必要（30 - 32行目）
      # ファイルはspec/files/image.jpgを差し、拡張子はjpgを指定。
    end
  end
end
