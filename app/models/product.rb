class Product < ApplicationRecord
  # belongs_to :user
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: :true
  #一つのモデルにアソシエーションを複数付けたい時は， belongs_to :カラム名, class_name: "モデル名"と記述
  # optional: trueとは、アソシエーションによって紐づけられた外部キーの値が存在していなくても、データベースに保存することができるオプションです。通常、外部キーの値が空白(null)であれば、バリデーションで弾かれてしまいます。
 
  has_many :images, dependent: :destroy
  #dependent: :destroy
  # dependent:とは、productsモデルに関連するimage画像が削除された場合に、データベースに保存されているimageカラムも一緒に削除される。ただ、今回は使用しない。

  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
  # accepts_nested_attributes_forは、fields_forメソッドを利用するための記述。
  # accepts_nested_attributes_forメソッドのオプションとして、引数に書くことができる記述です。このオプションをつけることで、親のレコードが削除された場合に、関連付いている子のレコードも一緒に削除してくれます。

  validates :images, presence: true
end
