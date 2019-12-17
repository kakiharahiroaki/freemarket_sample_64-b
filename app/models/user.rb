class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address
  accepts_nested_attributes_for :address

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  VALID_PHONE_REGEX = /^(0{1}\d{1,4}-{0,1}\d{1,4}-{0,1}\d{4})$/
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  validates :family_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :first_name_kana, presence: true, { with: VALID_KATAKANA_REGEX }
  validates :birthdata_year, presence: true, numericality: true 
  validates :birthdata_month, presence: true, numericality: true
  validates :birthdata_day, presence: true, numericality: true

  validates :phone_number, presence: true, numericality: true, format: { with: VALID_PHONE_REGEX }
end
