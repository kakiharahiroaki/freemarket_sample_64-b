class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card
  before_action :set_item, only: [:index, :pay]
  before_action :address_info
  before_action :full_name
  def index
    # blank?でcardが空かどうか判定
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
      
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（
    :customer => @card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

  def done
    
  end
  
  private

  def set_card
    @card = current_user.card
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def address_info
    @address = Address.find(current_user.id)
  end

  def full_name
    @full_name = current_user.family_name_kanji + current_user.first_name_kanji
  end

end
