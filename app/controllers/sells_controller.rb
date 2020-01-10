class SellsController < ApplicationController

  def index
    @item = Item.new
  end
  
  def create
    
    @item = Item.new(item_params) 
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :index
    end
    
  end

   
    private
  def item_params
    params.require(:item).permit(
      :products,
      :condition,
      :description_of_item,
      :price,
      :size,
      :shipping_date,
      :shipping_method,
      :postage,
      :shipping_origin,
      :brand,
      :category,
      images: []
    ).merge(user_id: current_user.id)
  end
end
