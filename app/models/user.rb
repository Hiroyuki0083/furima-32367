class User < ApplicationRecord
  has_many :items
  has_many :buy_managements
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  
  with_options presence: true do
    validates :name
    validates :lastname
    validates :name_furigana
    validates :lastname_furigana
    validates :nickname
    validates :birthday   
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "が無効です。全角文字で入力してください。" } do
    validates :name
    validates :lastname
  end

  with_options format: { with: /\A[ァ-ヶー]+\z/, message: "が無効です。全角カタカナで入力してください。" } do
    validates :name_furigana
    validates :lastname_furigana
  end

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "が無効です。半角英数字で入力してください。"} do
    validates :password
    validates :password_confirmation
  end

end

# 6行目以降presence: trueは不要。（9行目で定義済み）
