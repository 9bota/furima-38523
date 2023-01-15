# README

## users

| Column             | Type   | Options                       |
|--------------------|--------|-------------------------------|
| nickname           | string | null: false                   |
| email              | string | null: false, uniqueness: true |
| encrypted_password | string | null: false                   |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birthday           | date   | null: false                   |

### Association
- has_many :items
- has_many :buyers



## items

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | integer    | null: false                    |
| state         | integer    | null: false                    |
| cost          | integer    | null: false                    |
| area          | integer    | null: false                    |
| shipping_date | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order



## buyers

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipment



## shipment

| Column        | Type       | Options                        |
|-------------- |----------- |------------------------------- |
| postcode      | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| orders        | references | null: false, foreign_key: true |

### Association
- belongs_to :buyers