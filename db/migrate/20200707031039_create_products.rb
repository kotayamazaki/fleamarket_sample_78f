class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string      :name,                null: false
      t.text        :text,                null: false
      t.integer     :price,               null: false
      t.string      :condition,           null: false
      t.string      :shipping_area,       null: false
      t.string      :postage,             null: false
      t.string      :days,                null: false
      t.string      :credit_information   #いるかわかんないけどとりあえずカラム作ってあります，要らなければあとで削除
      t.references  :seller_user,         null: false, foreign_key: true
      t.references  :buyer_user,          foreign_key: true
      t.references  :category,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
