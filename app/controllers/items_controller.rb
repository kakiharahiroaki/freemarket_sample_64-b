class ItemsController < ApplicationController

  before_action :set_item , only: [:show, :edit, :update, :destroy, :stopExhibit,:resumeExhibit ]

  def index
    @items = Item.limit(10).order("created_at DESC")
  end
  
  def show
    @items = Item.where(user_id: @item.user.id).includes(:user).limit(6).order("created_at DESC")
  end


  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  def stopExhibit
   if @item.update(status: "出品停止中")
    redirect_to item_path, notice: "出品を一旦停止しました"
   else
    redirect_to item_path, notice: "エラー！変更に失敗しました。再度変更お願いします。"
   end
  end

  def resumeExhibit
   if @item.update(status: "出品中")
    redirect_to item_path, notice: "出品を再開しました"
   else
    redirect_to item_path, notice: "エラー！変更に失敗しました。再度変更お願いします。"
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

  def set_item
    @item = Item.find(params[:id])
  end

  

  
end
