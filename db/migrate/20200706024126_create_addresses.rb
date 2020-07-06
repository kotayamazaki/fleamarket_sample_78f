class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references  :user,         null: false, foreign_key: true
      t.integer     :postal_code,     null: false
      t.string      :prefecture,      null: false
      t.string      :city,            null: false
      t.string      :house_number,    null: false
      t.string      :room_number
      t.integer     :telephone_number
      t.timestamps
      # 送付先の氏名を追記する必要があるか後に確認する
    end
  end
end
