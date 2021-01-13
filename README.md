# テーブル設計

 ## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :comments



## itemsテーブル

| Column          | Type        | Options                        |
| ----------------| ----------- | ------------------------------ |
| image           |             |                                |
| product         | string      | null: false                    |
| product_d       | string      | null: false                    |
| category        | string      | null: false                    |
| state           | string      | null: false                    |
| delivery_fee    | string      | null: false                    |
| delivery_source | string      | null: false                    |
| delivery_days   | string      | null: false                    |
| user            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments



## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype

