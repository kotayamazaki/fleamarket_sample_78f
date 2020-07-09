class Image < ApplicationRecord
  mount_uploader :name, ImageUploader
  # rails g uploader image すると、 image_uploader.rb ファイルが生成され、そこへの変更点の記述をし、上記の内容の記述の追記をする。かつ、２番目の記述はカラム名を選択するようにする。
  belongs_to :product
end
