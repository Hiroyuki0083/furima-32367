class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, day: '--' },
    { id: 2, day: '1〜2日で発送' },
    { id: 3, day: '3〜4日で発送' },
    { id: 4, day: '5〜7日で発送' },

  ]

  include ActiveHash::Associations
  has_many :items
  
  end