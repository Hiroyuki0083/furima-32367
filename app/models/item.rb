class Item < ApplicationRecord
  has_one :buy_management
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
end
