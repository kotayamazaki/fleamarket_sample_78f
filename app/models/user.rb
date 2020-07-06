class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128
          #  password_length: 7..128は登録ログイン時にパスワード７文字以上の表示を設定

  validates :nickname, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 7}
  # length: { minimum: 7}は最低７文字必須のバリデーションを設定（大森，阿部）
  validates :first_name, :family_name, :first_kana, :family_kana, presence: true,
              format: {
                with: /\A[ぁ-んァ-ン一-龥]/,
                # 全角(平仮名、カタカナ、漢字)のみ入力（大森，阿部）
                message: "全角で入力して下さい"
              }
end
