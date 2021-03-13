# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| lastname           | string | null: false |
| name               | string | null: false |
| lastname_furigana  | string | null: false |
| name_furigana      | string | null: false | <!-- プロフやTELは新規登録に存在しない項目 -->
| encrypted_password | string | null: false | <!-- #deviceのgemを使用する -->

## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| buyer_id            | references | null: false |
| user_id             | references | null: false |
| name                | string     | null: false |
| item_status_id      | integer    | null: false | <!--imageはactive_storage導入時に自動生成 -->
| price               | string     | null: false |
| shipping_charges_id | integer    | null: false |
| shipping_area_id    | integer    | null: false |
| shipping_days_id    | integer    | null: false |
| category_id         | integer    | null: false |

## buy_management テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| item_id     | references | null: false |
| user_id     | references | null: false |
| user_name   | string     | null: false |
| user_address| string     | null: false |

## address テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| buyer_id    | references | null: false |
| user_id     | references | null: false |
| item_name   | string     | null: false |
| user_address| string     | null: false |

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
