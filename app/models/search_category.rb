class SearchCategory < ApplicationRecord
  has_many :items
  # validates :text, presence: true

  # def self.search(search)
  #   if search != ""
  #     SearchCategory.where('text LIKE(?)', "%#{search}%")
  #   else
  #     SearchCategory.all
  #   end
  # end

end
