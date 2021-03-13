# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| lastname           | string | null: false |
| name               | string | null: false |
| lastname_furigana  | string | null: false |
| name_furigana      | string | null: false | <!-- プロフやTELは新規登録に存在しない項目 -->
| encrypted_password | string | null: false | <!-- deviceのgemを使用する -->
| birthday           | date   | null: false | <!-- 年月日を区切るにはDATE型 -->
| email              | string | null: false |

### Association
- belongs_to :nickname
- belongs_to :lastname
- belongs_to :name
- belongs_to :name_furigana
- belongs_to :encrypted_password
- belongs_to :birthday
- belongs_to :email

## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| user                | references | null: false | <!-- references型で記述の場合、_idは不要 -->
| name                | string     | null: false |
| item_status_id      | integer    | null: false | <!--imageはactive_storage導入時に自動生成 -->
| price               | integer    | null: false |
| shipping_charge_id  | integer    | null: false | <!--複数形で記述するとエラーの恐れあり-->
| shipping_area_id    | integer    | null: false |
| shipping_day_id     | integer    | null: false |
| category_id         | integer    | null: false |

### Association
- belongs_to :user
- belongs_to :name
- has_many :item_status_id
- belongs_to :shipping_charge_id
- belongs_to :shipping_area_id
- has_many :shipping_day_id
- belongs_to :category_id


## buy_managements テーブル

| Column  | Type       | Options           |
| --------| ---------- | ----------------- |
| item    | references | foreign_key: true |
| user    | references | foreign_key: true |
<!-- | user_name   | string     | null: false | -->
<!-- | user_address| string     | null: false | -->

### Association
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ------------------|
<!-- | buyer_id        | references | null: false | -->
<!-- | user_id         | references | null: false | -->
<!-- | item_name       | string     | null: false | -->
<!-- | user_address    | string     | null: false | -->
<!-- | shipping_address| string     | null: false | -->
| post_number     | string     | null: false       |
| shipping_area_id| integer    | null: false       |
| municipality    | string     | null: false       |
| address         | string     | null: false       |
| building_name   | string     |                   |<!-- 建物名は任意項目 -->
| telephone_number| string     | null: false       |<!-- 先頭が０で始まるものはintegerにすると、先頭の０が消える場合がある -->
| buy_management  | references | foreign_key: true |

### Association
- belongs_to :post_number
- belongs_to :shipping_area_id
- belongs_to :municipality
- belongs_to :address
- belongs_to :building_name
- belongs_to :telephone_number
- belongs_to :buy_management


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
