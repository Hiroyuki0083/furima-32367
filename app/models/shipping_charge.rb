class ShippingCharge < ActiveHash::Base
  self.data = [
    { id: 1, charge: '--' },
    { id: 2, charge: '購入者' },
    { id: 3, charge: '出品者' },
  ]

  include ActiveHash::Associations
  has_many :items

end