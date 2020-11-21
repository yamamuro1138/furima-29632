# テーブル設計

## usersテーブル

|column  |Type  |options    |
|--------|------|-----------|
|name    |string|null: false|
|email   |string|null: false|
|password|string|null: false|

### Association

- has_many :user_items
- has_many :user_purchasess
- has_many :items, through: user_items
- has_many :purchasess, through: user_purchasess

## itemsテーブル

|column          |Type   |options    |
|----------------|-------|-----------|
|image           |string |null: false|
|item_name       |string |null: false|
|item_explanation|text   |null: false|
|category        |string |null: false|
|item_status     |text   |null: false|
|delivery_fee    |integer|null: false|
|shipping_area   |string |null: false|
|days_to_ships   |integer|null: false|
|price           |integer|null: false|
|seller_name     |string |null: false|

### Association

- has_many :user_items
- has_many :users, through: user_items
- has_one :purchasess

## user_itemsテーブル

|column|Type     |options          |
|------|---------|-----------------|
|user  |reference|foreign_key: true|
|item  |reference|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## purchasessテーブル

|column    |Type  |options    |
|----------|------|-----------|
|buyer_name|string|null: false|

### Associationテーブル

- has_many :user_purchasess
- has_many :users, through: user_purchasess
- has_one :deliverys

## user_purchasessテーブル

|column|Type     |options          |
|------|---------|-----------------|
|user  |reference|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :purchases

## deliverysテーブル

|column        |Type   |options    |
|--------------|-------|-----------|
|postal_code   |integer|null: false|
|prefectures   |string |null: false|
|municipalities|string |null: false|
|address       |string |null: false|
|phone_number  |integer|null: false|

### Associationテーブル

- has_one :purchasess