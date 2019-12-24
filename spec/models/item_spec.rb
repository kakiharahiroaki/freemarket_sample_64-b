require 'rails_helper'

describe Item do
  describe '#create' do
    it "全て揃っている時保存できる" do
        item = build(:item)
        expect(item).to be_valid
    end
    
    #空の場合のテスト
    # it "is invalid without a images" do
    #     item = build(:item, images:[] )
    #     item.valid?
    #     expect(item.errors[:images]).to include("を入力してください")
    # end

    it "is invalid without a products" do
        item = build(:item, products: "")
        item.valid?
    end

    it "is invalid without a description_of_item" do
        item = build(:item, description_of_item: "")
        item.valid?
    end

    it "is invalid without a price" do
        item = build(:item, price: "")
        item.valid?
    end

    it "is invalid without a size" do
        item = build(:item, size: "")
        item.valid?
    end

    it "is invalid without a shipping_date" do
        item = build(:item, shipping_date: "")
        item.valid?
    end

    it "is invalid without a shipping_method" do
        item = build(:item, shipping_method: "")
        item.valid?
    end

    it "is invalid without a postage" do
        item = build(:item, postage: "")
        item.valid?
    end

    it "is invalid without a shipping_origin" do
        item = build(:item, shipping_origin: "")
        item.valid?
    end

    it "is invalid without a condition" do
        item = build(:item, condition: "")
        item.valid?
    end

    it "is invalid without a user_id" do
        item = build(:item, user_id: "")
        item.valid?
    end

    
    #nameの文字が40文字以上と以下の場合
    it "is invalid products is too long maximum 40 characters" do
        item = build(:item, products: "a" * 41)
        item.valid?
    end

    it "is valid with a products that has less than 40 characters" do
        item = build(:item, products: "a" * 39)
    end

    #descriptionの文字が1000文字以上と以下の場合
    it "is invalid description_of_item is too long maximum 40 characters" do
        item = build(:item, description_of_item: "a" * 1001)
        item.valid?
    end

    it "is valid with a description_of_item that has less than 1000 characters" do
        item = build(:item, description_of_item: "a" * 1000)
    end

    #priceが9999999円以上の場合
    it "is invalid price is too much maximum 9999999" do
        item = build(:item, price: 10000000)
        item.valid?
    end

    #priceが9999999円の場合
    it "is valid price is too much maximum 9999999" do
        item = build(:item, price: 9999999)
    end

    #priceが300円以下の場合
    it "is invalid with a that has less than 300" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("は一覧にありません")
    end

    #priceが300円の場合
    it "is valid with a that has less than 300" do
        item = build(:item, price: 300)
    end

    #brandが無くても保存できる
    it "is valid without a brand_id" do
        item = build(:item, brand_id: "")

    end
  end
end