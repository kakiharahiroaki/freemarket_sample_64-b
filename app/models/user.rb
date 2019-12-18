class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_one :address
  has_many :sns_credentials, dependent: :destroy
  accepts_nested_attributes_for :address

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  VALID_PHONE_REGEX = /\A\d{10,11}\z/
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  # registrationのバリデーション
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  validates :family_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :birthdata_year, presence: true, numericality: true 
  validates :birthdata_month, presence: true, numericality: true
  validates :birthdata_day, presence: true, numericality: true
  # sms-confirmationのバリデーション
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
         

      def self.from_omniauth(auth)
      user = User.where(email: auth.email).first
      sns_credential_record = SnsCredential.where(provider: auth.provider, uid: auth.uid, token: auth.token)
      if user.present?
        unless sns_credential_record.present?
          SnsCredential.create(
            users: auth.users,
            token: auth.token,
            user_id: user.id,
            provider: auth.provider,
            uid: auth.uid
          )
        end
      elsif
        user = User.new(
          id: User.all.last.id + 1,
          email: auth.info.email,
          password: Devise.friendly_token[0, 20],
        )
        SnsCredential.new(
          users: auth.users,
          token: auth.token,
          provider: auth.provider,
          uid: auth.uid,
        )
      end 
    user
    end
end
