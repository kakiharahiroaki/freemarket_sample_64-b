
class UsersController < ApplicationController
    before_action :set_user , only: [:personal,:profile,:mypage]

    def personal
    end
   

    def profile
    end

    def mypage
    end

    def logout
    end

    def sell_item
        @items = Item.where(user_id: current_user.id)
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

end
