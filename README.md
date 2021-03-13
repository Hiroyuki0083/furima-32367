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

## buy_managements テーブル

| Column  | Type       | Options           |
| --------| ---------- | ----------------- |
| item    | references | foreign_key: true |
| user    | references | foreign_key: true |
<!-- | user_name   | string     | null: false | -->
<!-- | user_address| string     | null: false | -->

## addresses テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| buyer_id        | references | null: false |
| user_id         | references | null: false |
| item_name       | string     | null: false |
| user_address    | string     | null: false |
| shipping_address| string     | null: false |
| post_number     | integer    | null: false |
| prefectures     | string     | null: false |
| municipality    | string     | null: false |
| address         | integer    | null: false |
| building_name   | string     | null: false |
| telephone_number| integer    | null: false |


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
