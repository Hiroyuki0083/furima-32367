class Form
  include ActiveModel::Model
  attr_accessor :token, :post_number, :shipping_area_id, :municipality, :address, :telephone_number, :user_id, :item_id, :building_name

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
    validates :price
  end

  with_options format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input full-width characters." } do
    validates :post_number
  end

  with_options numericality: { with: /\A\d{11}\z/} do
    validates :telephone_number
  end  
  
  with_options numericality: { other_than: 1} do
    validates :shipping_area_id
  end
 
  def save
    # 各テーブルにデータを保存する処理を書く
    buy_management = BuyManagement.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, buy_management_id: buy_management.id)
  end
end
