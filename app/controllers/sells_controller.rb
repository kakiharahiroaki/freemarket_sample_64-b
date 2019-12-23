class SellsController < ApplicationController

  def new
    @item = Item.new
  end
  
  def create
    
    @item = Item.new(item_params) 
    if @item.save!
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
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