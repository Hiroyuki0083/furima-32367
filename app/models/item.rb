class Item < ApplicationRecord
  has_one :buy_management
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :image
    validates :information
    validates :price
  end

  with_options numericality: { other_than: 1, message: "を選択してください。"} do
    validates :category_id #only_integerだと数値ならどれでもよい、になる
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は300円〜9,999,999円で入力してください。" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :category
  belongs_to :status

end
