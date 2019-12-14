class SignupController < ApplicationController
  def index
  end

  def registration
    @user = User.new
  end

  def sms_confirmation
  end

  def input_address
  end

  def payment
  end

  def signup_complete
  end

  def login
  end
  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :ntroduce,
      :family_name_kanji,
      :first_name_kanji,
      :family_name_kana,
      :first_name_kana,
      :birthdata_year,
      :birthdata_month,
      :birthdata_day,
      :phone_number,
      :email,
      :encrypted_password,
      :reset_password_token,
      :reset_password_sent_at,
      :remember_created_at,
      address_attributes: [:id, :postcode, :prefecture, :city, :block, :building, :user]
    )
  end
end
