class Order < ApplicationRecord
  has_one :buy_management
  belongs_to :user
end