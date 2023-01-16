# README

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
- has_many :orders



## items

* Database initialization
| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | integer    | null: false                    |
| state       | integer    | null: false                    |
| ship_cost   | integer    | null: false                    |
| ship_area   | integer    | null: false                    |
| ship_date   | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order



## orders

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :payment



## payments

| Column        | Type       | Options                        |
|-------------- |----------- |------------------------------- |
| postcode      | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- has_one :order