class Category < ApplicationRecord
  has_one :product
  has_ancestry

  # def self.search(search)
  #   return Category.all unless search
  #   Category.where(, "%#{search}%")
  # end
end
