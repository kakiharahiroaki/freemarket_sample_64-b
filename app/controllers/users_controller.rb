
class UsersController < ApplicationController
    def show
    end

    def create
    end
   
    def destroy
    end

    def update
    end

    def sell_item
        @items = Item.where(user_id: current_user.id)
    end
end
