class Order < ApplicationRecord
  has_one :buy_management
  belongs_to :user
  attr_accessor :token

  validates :telephone_number, numericality: { /\A\d{11}\z/}

  with_options presence: true do
    validates :municipality
    validates :address
  end

  with_options format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input full-width characters." } do
    validates :post_number
  end
end