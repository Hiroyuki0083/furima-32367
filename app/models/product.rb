class Product < ApplicationRecord

  belongs_to :search_category
  validates :text, presence: true

  def self.search(search)
    if search != ""
      Product.where('text LIKE(?)', "%#{search}%")
    else
      Product.all
    end
  end
end