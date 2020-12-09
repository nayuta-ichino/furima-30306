# テーブル設計

## usersテーブル
| Column             | Type    | Option                    |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :buy_records

## itemsテーブル
| Column           | Type       | Option                   |
| ---------------- | ---------- | ------------------------ |
| name             | string     | null: false              |
| info             | text       | null: false              |
| price            | integer    | null: false              |
| user             | references | null: false, foreign_key | 
| category_id      | integer    | null: false              |
| item_status_id   | integer    | null: false              |
| shipping_cost_id | integer    | null: false              |
| prefecture_id    | integer    | null: false              |
| shipping_day_id  | integer    | null: false              |

### Association
- has_one :buy_record
- belongs_to :user
- belongs_to :category
- belongs_to :item_status
- belongs_to :shipping_cost
- belongs_to :prefecture
- belongs_to :shipping_day


## addressesテーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| by_record     | references | null: false, foreign_key: true |
| prefecture_id | integer    | null: false                    |

### Association
- belongs_to :buy_record


## buy_recordsテーブル
| Column  | Type       | Option                         |
|-------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address