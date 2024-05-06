class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :family_name, :personal_name, presence: true, format: { with: VALID_NAME_REGEX }
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, :personal_name_kana, presence: true, format: { with: VALID_KANA_NAME_REGEX }
  validates :birth_date, presence: true
end
