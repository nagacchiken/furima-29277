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

### Association

- has_many :purchases

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping_address

## shipping_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |

### Association

- belongs_to :purchase

## items テーブル

| Column           | Type    | Options     |
| ---------------  | ------  | ----------- |
| name             | string  | null: false |
| description      | text    | null: false |
| price            | integer | null: false |
| item_status      | string  | null: false |
| delivery_fee     | integer | null: false |
| date_of_shipment | string  | null: false |

### Association

- has_one    :purchases

