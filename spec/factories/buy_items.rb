FactoryBot.define do
  factory :buy_item do
    token { '4242424242424242' }
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '愛知県' }
    address { '名古屋市1' }
    building { '栄1111' }
    phone_number { '09012345678' }
    association :user
    association :item
  end
end
