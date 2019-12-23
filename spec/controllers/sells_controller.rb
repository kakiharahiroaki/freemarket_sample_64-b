require 'rails_helper'

Rspec.describe "SellsController", type: :controller do
  
  def create
    @item = Item.new(item_params) 
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
    end
  end
end