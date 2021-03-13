# README

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| name      | string | null: false |
| password  | string | null: false |
| profile   | text   | null: false |
| telephone | string | null: false |
| address   | text   | null: false |

## itemsテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| buyer_id   | references | null: false |
| user_id    | references | null: false |
| item_name  | string     | null: false |
| image      | text       |             |
| item_status| string     | null: false |
| price      | string     | null: false |

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
