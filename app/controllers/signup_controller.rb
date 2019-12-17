class SignupController < ApplicationController
  def new_member
  end

  def registration
    @user = User.new
  end
  # registration(会員情報入力)で入力したデータをsessionで仮保存
  def sms_confirmation
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    # パスワードは6文字以上じゃないと登録できない
    session[:password] = user_params[:password]
    session[:family_name_kanji] = user_params[:family_name_kanji]
    session[:first_name_kanji] = user_params[:first_name_kanji]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdata_year] = user_params[:birthdata_year]
    session[:birthdata_month] = user_params[:birthdata_month]
    session[:birthdata_day] = user_params[:birthdata_day]
    @user = User.new
    
  end
  # sms_confirmation（電話番号の確認）で入力したデータをsessionで仮保存
  def input_address
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_address
    
  end
# input_address（住所入力）で入力したデータをsessionで仮保存
  def payment
    # session[:address_attributes] = user_params[:address_attributes]
    # @user = User.new
    # @user.build_address
  end
# クレジットカードのテーブルを作りsessionで保存
  def signup_complete
    # session[:address_attributes] = user_params[:address_attributes]    @user = User.new
    # @user.build_address
    
  end
# createアクションでsessionをdbに保存
  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name_kanji: session[:family_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdata_year: session[:birthdata_year],
      birthdata_month: session[:birthdata_month],
      birthdata_day: session[:birthdata_day],
      phone_number: session[:phone_number],
    )
    @user.build_address(user_params[:address_attributes])
    if @user.save!
      session[:id] = @user.id
      redirect_to signup_complete_signup_index_path
    else
      render :new_member
    end
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
      :password,
      :reset_password_token,
      :reset_password_sent_at,
      :remember_created_at,
      address_attributes: [:id, :family_name, :first_name, :family_name_katakana, :first_name_katakana, :postcode, :prefecture, :city, :block, :building, :telephone_number]
    )
  end
end
