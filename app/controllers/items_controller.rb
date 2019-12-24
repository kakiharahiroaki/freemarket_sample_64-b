class ItemsController < ApplicationController
  def index
  end
  
  def show
    @item = Item.find(params[:id])
    @items = Item.where(user_id: @item.user.id).includes(:user).limit(6).order("created_at DESC")
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end
end
