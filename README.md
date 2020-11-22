# テーブル設計

## usersテーブル

|column               |Type    |options    |
|---------------------|--------|-----------|
|name                 |string  |null: false|
|email                |string  |null: false|
|encrypted_password   |string  |null: false|
|family_name          |string  |null: false|
|first_name           |string  |null: false|
|first_name_kana      |string  |null: false|
|family_name_kana     |string  |null: false|
|birthday             |date    |null: false|

### Association

- has_many :items
- has_many :purchases

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

- belongs_to :user
- has_one :purchase


## purchasesテーブル

|column    |Type     |options          |
|----------|---------|-----------------|
|user      |reference|foreign_key: true|
|item      |reference|foreign_key: true|
### Associationテーブル

- belongs_to :user
- belongs_to :item
- has_one :delivery


## deliverysテーブル

|column        |Type     |options            |
|--------------|---------|-------------------|
|postal_code   |string   |null: false        |
|prefectures_id|integer  |null: false        |
|municipalities|string   |null: false        |
|address       |string   |null: false        |
|phone_number  |string   |null: false        |
|building_name |string   |                   |
|purchase      |reference|foreign_key: true  |

### Associationテーブル

- belongs_to :purchase