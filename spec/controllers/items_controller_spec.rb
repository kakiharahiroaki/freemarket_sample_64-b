require 'rails_helper'

describe ItemsController do
  describe 'GET #show' do
   it "インスタンス変数は期待した値になるか？" do
        item = create(:item)   
        get :show, params: {id: item} #擬似的にリクエストを行ったことにするコードを書く
        expect(assigns(:item)).to eq item #エクスペクテーションを書く
    end 

    it "商品詳細ページに遷移するか？" do
         item = create(:item)
         get :show , params: {id: item}     # 擬似的にリクエストを行ったことにするコードを書く
         expect(response).to render_template :show  #エクスペクテーションを書く
    end
  end
end