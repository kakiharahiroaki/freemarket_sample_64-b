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

  describe 'GET #edit' do
   it "インスタンス変数は期待した値になるか？" do
       item = create(:item) #編集するためにはitemテーブルにレコードが入っていなければいけないので、exampleでテーブルにレコードを保存する
       get :edit, params: {id: item} #擬似的にリクエストを行ったことにするコードを書く
       expect(assigns(:item)).to eq item #エクスペクテーションを書く
   end

   it "商品編集ページに遷移するか？" do
      item = create(:item) #編集するためにはitemテーブルにレコードが入っていなければいけないので、exampleでテーブルにレコードを保存する
      get :edit, params: {id: item}
      expect(response).to render_template :edit
   end
    
  end
end