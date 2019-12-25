class ItemsController < ApplicationController
  
  def index
    @items = Item.limit(10).order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where(user_id: @item.user.id).includes(:user).limit(6).order("created_at DESC")
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy #destroyメソッドを使用し対象のツイートを削除する。
      redirect_to root_path
    end
  end

  private
  def item_params
    params.permit(
      :products,
      :condition,
      :description_of_item,
      :price,
      :size,
      :shipping_date,
      :shipping_method,
      :postage,
      :shipping_origin,
      # :brand_id,
      # :category_id,
      images: []
    ).merge(user_id: current_user.id)
  end
end
