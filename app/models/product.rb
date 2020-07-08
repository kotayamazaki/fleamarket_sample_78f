class Product < ApplicationRecord
  # belongs_to :user
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  #一つのモデルにアソシエーションを複数付けたい時は， belongs_to :カラム名, class_name: "モデル名"　と記述
  # has_many :images
  # belongs_to :category
end
