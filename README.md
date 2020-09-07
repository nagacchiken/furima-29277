# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping_address

## shipping_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| price               | integer    | null: false                    |
| item_status_id      | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| date_of_shipment_id | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| shipping_region_id  | integer    | null: false                    |

### Association

- has_one    :purchase
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :item_status
- belongs_to_active_hash :date_of_shipment
- belongs_to_active_hash :delivery_fee_id
- belongs_to_active_hash :prefecture