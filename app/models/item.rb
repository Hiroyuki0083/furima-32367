class Item < ApplicationRecord
  has_one :buy_management
  belongs_to :user

  validates :image, presence: true
end
