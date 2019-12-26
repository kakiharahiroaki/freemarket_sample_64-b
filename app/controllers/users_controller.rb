
class UsersController < ApplicationController
    def show
      @user = User.find(current_user.id)
    end

    def create
    end
   
    def destroy
    end

    def update
    end

    def sell_item
        # @item = Item.find(id: current_user.id)
        @items = Item.where(user_id: current_user.id).includes(:user)
    end
end
