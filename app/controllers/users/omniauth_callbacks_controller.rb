# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?  #もし@userがDBに既にいたら、ログイン状態にします  
      sign_in_and_redirect @user, event: :authentication 
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else  #もし@userがDBにいない場合、新規登録ページにリダイレクトします
      session["devise.facebook_data"] = request.env["omniauth.auth"]
        #データをsessionに入れることによって、新規登録ページの入力欄に、予め情報を入れておくなどが可能になります。
      redirect_to new_menber_users_path
    end
  end

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication 
      set_flash_message(:notice, :success, kind: 'google') if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"][:info]
      #google認証の場合は、なぜかauth_hashの容量が大きく、一瞬で容量オーバーとなるため、新規登録時に必要な情報のみをsessionに渡すこととしました。（おそらく画像データのせい？）
      redirect_to new_menber_users_path
    end
  end
end

    before_action :check_captcha, only: [:create]
  
    def new
      @user = User.new
      @sns_user = SnsUser.temporary_params(session["devise.omniauth_data"])
    end
  
    def create
      @sns_user = SnsUser.new(sns_user_params)
      @user = User.new(@sns_user.user_params)
      if @user.save
        SnsCredential.create(@sns_user.sns_params.merge(user_id: @user.id))
        sign_in_and_custom_redirect @user, event: :authentication
      else
        render :new
      end
    end
  
    def callback
      callback_for(request.env["omniauth.auth"])
    end
  
    private
  
    def callback_for(response)
      @user = User.from_omniauth(response)
      if @user.present?
        sign_in_and_custom_redirect @user, event: :authentication
      else
        session["devise.omniauth_data"] = response
        provider_path = response["provider"].to_s.eql?("facebook") ? new_user_facebook_omniauth_registration_path : new_user_google_omniauth_registration_path
        redirect_to provider_path
      end
    end
  
    def check_captcha
      @sns_user = SnsUser.new(sns_user_params)
      @user = User.new(@sns_user.user_params)
      @user.validate
      unless verify_recaptcha(model: @user)
        render :new
      end
    end
  
    def sign_in_and_custom_redirect(resource_or_scope, *args)
      options = args.extract_options!
      scope = Devise::Mapping.find_scope!(resource_or_scope)
      resource = args.last || resource_or_scope
      sign_in(scope, resource, options)
      user = User.find(resource.id)
      if user.profile.blank?
        profile = Profile.new({ nickname: user.nickname, user_id: user.id })
        profile.save(validate: false)
      end
      redirect_to after_sign_in_path_for(resource)
    end
  
    def failure
      redirect_to root_path
      redirect_to 新規登録ページ
    end
  end

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication 
      set_flash_message(:notice, :success, kind: 'google') if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"][:info]
      #google認証の場合は、なぜかauth_hashの容量が大きく、一瞬で容量オーバーとなるため、新規登録時に必要な情報のみをsessionに渡すこととしました。（おそらく画像データのせい？）
      redirect_to new_menber_users_path
    end
  end
end

