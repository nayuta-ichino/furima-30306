# テーブル設計

## usersテーブル
| Column    | Type    | Option                    |
| --------- | ------- | ------------------------- |
| nickname  | string  | null: false               |
| email     | string  | null: false, unique: true |
| password  | string  | null: false, unique: true |
| name      | string  | null: false               |
| name_kana | string  | null: false               |
| birthday  | integer | null: false               |

### Association
- has_many :items
- has_many :buy_records
- belongs_to :addresses
- belongs_to :birthday


## itemsテーブル
| Column           | Type       | Option                   |
| ---------------- | ---------- | ------------------------ |
| image            |            | ActiveStorageで実装      |
| item_name        | string     | null: false              |
| item_info        | string     | null: false              |
| price            | integer    | null: false              |
| user_id          | references | null: false, foreign_key | 
| category         | integer    | null: false              |
| item_status      | integer    | null: false              |
| shipping_cost    | integer    | null: false              |
| by_prefecture_id | integer    | null: false              |
| shipping_day     | integer    | null: false              |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :item_status
- belongs_to :shipping_cost
- belongs_to :prefecture
- belongs_to :shipping_day


## addressesテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| postcode      | integer    | null: false                   |
| city          | string     | null: false                   |
| block         | integer    | null: false                   |
| building      | string     |                               |
| phone_number  | integer    | null: false, unique: true     |
| user_id       | references | null: false, foreign_key: true|
| prefecture_id | integer    | null: false                   |

### Association
- belongs_to :user
- belongs_to :prefecture


## buy_recordsテーブル
| Column  | Type       | Option                         |
|-------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user