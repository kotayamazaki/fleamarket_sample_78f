class Category < ApplicationRecord
  has_one :product
  has_ancestry
end
