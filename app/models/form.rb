class Form
  include ActiveModel::Model
  attr_accessor :post_number, :shipping_area_id, :municipality, :address, :telephone_number, :user_id, :item_id, :building_name

  with_options presence: true do
    # validates :token
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
  end

  with_options format: { with: /\A\d{3}[-]\d{4}\z/} do
    validates :post_number
  end

  with_options numericality: { with: /\A\d{11}\z/} do
    validates :telephone_number
  end  
  
  # with_options numericality: { /^[0-9]+$/} do
    
  # end

  with_options numericality: { other_than: 1} do
    validates :shipping_area_id
  end
 
  # with_options numericality: { /\A\d{11}\z/} do
  #   validates :telephone_number
  # end

  # :token、配送先住所の項目、ユーザーid、商品のid　についてのバリデーション

  def save
    # 各テーブルにデータを保存する処理を書く
    buy_manegement = BuyManegement.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, buy_manegement_id: buy_manegement.id)
  end
end