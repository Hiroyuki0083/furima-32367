class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :buy_managements

  with_options presence: true do
    validates :name
    validates :lastname
    validates :name_furigana
    validates :lastname_furigana
    validates :nickname
    validates :birthday   
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." } do
    validates :name
    validates :lastname
  end

  with_options format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." } do
    validates :name_furigana
    validates :lastname_furigana
  end

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Input full-width characters."} do
    validates :password
    validates :password_confirmation
  end
end

# 7行目以降presence: trueは不要。（7行目で定義済み）
