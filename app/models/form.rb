class form < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token, :shipping_area_id, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1} do
    validates :shipping_area_id
  end
  
  # :token、配送先住所の項目、ユーザーid、商品のid　についてのバリデーション

  def save
    # 各テーブルにデータを保存する処理を書く
    buy_managements = BuyManagements.create(item: item, user: user)
    Addresses.create(post_number: post_number, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, buy_management: buy_management)
  end
end