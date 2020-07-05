require 'faker'

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'test' + Faker::Internet.password(min_length: 7, max_length: 20) }
    birth_day { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
    first_name { 'Test' }
    last_name { 'User' }
    first_name_reading { 'テスト' }
    last_name_reading { 'ユーザー' }
  end
end
