class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_one :address
  accepts_nested_attributes_for :address
         
  has_many :sns_credentials, dependent: :destroy

      def self.from_omniauth(auth)
        user = User.find_by(email: auth.info.email)
        sns_credential_record = SnsCredential.where(provider: auth.provider, uid: auth.uid)
        if user.present?
          unless sns_credential_record.present?
            SnsCredential.create(
              provider: auth.provider,
              uid: auth.uid
            )
          end
        elsif
          user = User.new(
            email: auth.info.email,
            password: Devise.friendly_token[0, 20],
            nickname: auth.info.name,
          )
          SnsCredential.new(
            provider: auth.provider,
            uid: auth.uid,
          )
        end 
      user
      end
    end