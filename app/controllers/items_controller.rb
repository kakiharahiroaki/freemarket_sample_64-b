class ItemsController < ApplicationController
  def index
    @items = Item.limit(10).order("created_at DESC")
  end
  
  def show
    @item = Item.find(params[:id])
    @items = Item.where(user_id: @item.user.id).includes(:user).limit(6).order("created_at DESC")
  end

end
