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
| email              | string | null: false,unique: true |<!-- emailは一意性なのでunique: true -->

### Association
- has_many :items
- has_many :buy_managements

## itemsテーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| user                | references | null: false,foreign_key: true | <!-- references型で記述の場合、_idは不要 -->
| name                | string     | null: false |
| status_id           | integer    | null: false | <!--imageはactive_storage導入時に自動生成 -->
| information         | text       | null: false | <!-- 長文保存の可能性があればTEXT -->
| price               | integer    | null: false |
| shipping_charge_id  | integer    | null: false | <!--複数形で記述するとエラーの恐れあり-->
| shipping_area_id    | integer    | null: false |
| shipping_day_id     | integer    | null: false |
| category_id         | integer    | null: false |

### Association
- has_one :buy_management <!-- １つの商品は１つの購入情報を持つ関係が成り立つ。Belongだと属すになる。1対1の関係の場合はhas_one -->
- belongs_to :user

## buy_managements テーブル

| Column  | Type       | Options           |
| --------| ---------- | ----------------- |
| item    | references | foreign_key: true |
| user    | references | foreign_key: true |

### Association
- has_one :address <!-- 購入履歴に対する購入者の住所は１つ -->
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ------------------|
| post_number     | string     | null: false       |
| shipping_area_id| integer    | null: false       |
| municipality    | string     | null: false       |
| address         | string     | null: false       |
| building_name   | string     |                   |<!-- 建物名は任意項目 -->
| telephone_number| string     | null: false       |<!-- 先頭が０で始まるものはintegerにすると、先頭の０が消える場合がある -->
| buy_management  | references | foreign_key: true |

### Association
- belongs_to :shipping_area <!-- アソシエーションを組む場合は_idは不要 -->
- belongs_to :buy_management

## searchテーブル


<!-- buymanagement.rb
class BuyManegement < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address
end

migration
class CreateBuyManegements < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_manegements do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end -->
