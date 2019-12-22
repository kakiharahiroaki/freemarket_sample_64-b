class Address < ApplicationRecord
  belongs_to :user
  # ハイフン有無問わず
  VALID_POST_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/
  VALID_TELEPHONE_REGEX = /\A\d{11}\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  # input-addressのバリデーション
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_katakana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_katakana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :postcode, presence: true, numericality: true, format: { with: VALID_POST_REGEX }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :building, presence: true
  validates :telephone_number, presence: true, format: { with: VALID_TELEPHONE_REGEX }

  
end
