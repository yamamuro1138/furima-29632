# テーブル設計

## usersテーブル

|column               |Type    |options    |
|---------------------|--------|-----------|
|name                 |string  |null: false|
|email                |string  |null: false|
|encrypted_password   |string  |null: false|
|password_confirmation|string  |null: false|
|family_name          |string  |null: false|
|first_name           |string  |null: false|
|family_name_kana     |string  |null: false|
|birthday             |datetime|null: false|

### Association

- has_many :user_items
- has_many :user_purchases
- has_many :items, through: user_items
- has_many :purchases, through: user_purchases

## itemsテーブル

|column          |Type     |options          |
|----------------|---------|-----------------|
|item_name       |string   |null: false      |
|item_explanation|text     |null: false      |
|category_id     |integer  |null: false      |
|item_status_id  |integer  |null: false      |
|delivery_fee_id |integer  |null: false      |
|shipping_area_id|integer  |null: false      |
|days_to_ships_id|integer  |null: false      |
|price           |integer  |null: false      |
|user            |reference|foreign_key: true|

### Association

- has_many :user_items
- has_many :users, through: user_items
- has_one :purchases

## user_itemsテーブル

|column|Type     |options          |
|------|---------|-----------------|
|user  |reference|foreign_key: true|
|item  |reference|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## purchasesテーブル

|column    |Type     |options          |
|----------|---------|-----------------|
|buyer_name|string   |null: false      |
|user      |reference|foreign_key: true|
|item_id   |integer  |foreign_key: true|
### Associationテーブル

- has_many :user_purchases
- has_many :users, through: user_purchases
- has_one :deliverys

## user_purchasesテーブル

|column   |Type     |options          |
|---------|---------|-----------------|
|user     |reference|foreign_key: true|
|purchases|reference|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :purchase

## deliverysテーブル

|column        |Type   |options    |
|--------------|-------|-----------|
|postal_code   |string |null: false|
|prefectures   |string |null: false|
|municipalities|string |null: false|
|address       |string |null: false|
|phone_number  |string |null: false|
|building_name |string |           |

### Associationテーブル

- has_one :purchases