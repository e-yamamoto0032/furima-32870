# テーブル設計

 ## usersテーブル

| Column            | Type   | Options      |
| ------------------| ------ | ------------ |
| nick_name         | string | null: false  |
| email             | string | unique: true |
| encrypted_password| string | null: false  |
| last_name         | string | null: false  |
| first_name        | string | null: false  |
| last_name_kana    | string | null: false  |
| first_name_kana   | string | null: false  |
| birthday          | date   | null: false  |

### Association

- has_many :items, through:addresses
- has_many :addresses
- has_many :records




## itemsテーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| product            | string       | null: false                    |
| product_d          | string       | null: false                    |
| category_id        | integer      | null: false                    |
| state_id           | integer      | null: false                    |
| delivery_fee_id    | integer      | null: false                    |
| delivery_source_id | integer      | null: false                    |
| delivery_day_id    | integer      | null: false                    |
| price              | integer      | null: false                    |
| user_id            | references   | null: false, foreign_key: true |

### Association

- has_many :users, through:addresses
- has_many :addresses
- has_one :record



##  addressesテーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false,                   |
| city          | string     | null: false,                   |
| block         | string     | null: false,                   |
| building      | string     |                                |
| phone_number  | string     | null: false,                   |
| record_id     | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |


### Association

- belongs_to :record
- belongs_to :item



##  recordsテーブル

| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address