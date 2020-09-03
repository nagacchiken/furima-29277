# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| family_name     | string | null: false |
| first_name      | string | null: false |
| family_name_kana| string | null: false |
| first_name_kana | string | null: false |

### Association

- has_many :comments
- has_many :purchases

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |
| text      | text       | null: false                    |

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

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| address | string     | null: false                    |

### Association

- belongs_to :room
- belongs_to :user

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

- has_many   :comments
- has_many   :categories, through: item_categories
- has_one    :purchases

## item_categories テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| category_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :category

## categories テーブル

| Column           | Type    | Options     |
| ---------------  | ------  | ----------- |
| name             | string  | null: false |


### Association

- has_many   :items, through: item_categories