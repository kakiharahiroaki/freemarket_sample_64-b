class Address < ApplicationRecord
  belongs_to :user

  VALID_POST_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/
  VALID_TELEPHONE_REGEX = /^(0{1}\d{1,4}-{0,1}\d{1,4}-{0,1}\d{4})$/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_katakana, presence: true, { with: VALID_KANA_REGEX }
  validates :first_name_katakana, presence: true, { with: VALID_KANA_REGEX }
  validates :postcode, presence: true, numericality: true, format: { with: VALID_POST_REGEX }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :building, presence: true
  validates :telephone_number, presence: true, numericality: true, format: { with: VALID_TELEPHONE_REGEX }
end
