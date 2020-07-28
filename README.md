## DB design

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false,unique: true|
| email              | string              | null: false             |
| encrypted_password | integer             | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_reading | string              | null: false             |
| last_name_reading  | string              | null: false             |
| birth_day          | date             | null: false             |

### Association

- has_many :items, dependent: :destroy
- has_many :item_purchases, dependent: :destroy

## addresses table

| Column       | Type    | Options           |
|--------------|---------|-------------------|
| postal_code  | string  | null: false       |
| prefecture   | integer | null: false       |
| city         | string  | null: false       |
| address      | string  | null: false       |
| building     | string  |                   |
| phone_number | string  | null: false       |
| item_id(FK)  | integer | foreign_key: true |

### Association

- belongs_to :item

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| price                               | integer    | null: false       |
| description                         | text       | null: false       |
| scheduled_delivery_id               | integer    | null: false       |
| shipping_fee_status_id              | integer    | null: false       |
| prefecture_id                       | integer    | null: false       |
| sales_status_id                     | integer    | null: false       |
| category_id                         | integer    | null: false       |
| user_id(FK)                         | integer    | foreign_key: true |

### Association

- belongs_to :user
- has_one :item_purchases, dependent: :destroy
- has_one :address, dependent: :destroy

## item_purchases table

| Column      | Type    | Options           |
|-------------|---------|-------------------|
| item_id(FK) | integer | foreign_key: true |
| user_id(FK) | integer | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
