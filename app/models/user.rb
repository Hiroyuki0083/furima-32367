class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, presence: true
    validates :name_furigana, presence: true
    validates :lastname_furigana, presence: true
    validates :nickname, presence: true
    validates :birthday, presence: true
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }
    validates :lastname, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }
    validates :name_furigana, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :lastname_furigana, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
    validates :password_confirmation, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
  end
end
