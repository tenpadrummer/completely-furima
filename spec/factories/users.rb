require 'faker'

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'test1234' }
    password_confirmation { 'test1234' }
    birth_day { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
    first_name { '田中' }
    last_name { '花子' }
    first_name_reading { 'テスト' }
    last_name_reading { 'ユーザー' }
  end
end
