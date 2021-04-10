class Item < ApplicationRecord
  has_one :buy_management
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :image
    validates :information
    validates :category_id, numericality: { other_than: 1} #only_integerだと数値ならどれでもよい、になる
    validates :status_id, numericality: { other_than: 1}
    validates :shipping_charge_id, numericality: { other_than: 1}
    validates :shipping_area_id, numericality: { other_than: 1}
    validates :shipping_day_id, numericality: { other_than: 1}
    validates :price
  end
  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
end
