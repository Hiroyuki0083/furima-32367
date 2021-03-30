class Item < ApplicationRecord
  has_one :buy_management
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :information
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end
  
  validates :price, length: { in: 300..9999999 }
  validates :price, numericality
end
