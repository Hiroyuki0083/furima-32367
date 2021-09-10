class Order < ApplicationRecord
  has_one :buy_management
  belongs_to :user
  attr_accessor :token
end