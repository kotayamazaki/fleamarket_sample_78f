class Address < ApplicationRecord
  belongs_to :user
  validates :postal_code, :prefecture, :city, :house_number, :room_number, :telephone_number, presence: true
end
