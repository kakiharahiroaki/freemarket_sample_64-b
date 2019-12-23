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
        expect(item.errors[:products]).to include("を入力してください")
    end

    it "is invalid without a description_of_item" do
        item = build(:item description_of_item: "")
        item.valid?
        expect(item.errors[:description_of_item]).to include("を入力してください")
    end

    it "is invalid without a price" do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a condition_id" do
        item = build(:item, size: "")
        item.valid?
        expect(item.errors[:size]).to include("を入力してください")
    end

    it "is invalid without a delivery_charge_id" do
        item = build(:item, shipping_method: "")
        item.valid?
        expect(item.errors[:shipping_method]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
        item = build(:item, prefecture_id: "")
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a delivery_days_id" do
        item = build(:item, delivery_days_id: "")
        item.valid?
        expect(item.errors[:delivery_days_id]).to include("を入力してください")
    end

    it "is invalid without a price" do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
    end

    #nameの文字が40文字以上と以下の場合
    it "is invalid name is too long maximum 40 characters" do
        item = build(:item, name: "a" * 41)
        item.valid?
        expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "is valid with a name that has less than 40 characters" do
        item = build(:item, name: "a" * 39)
        expect(item).to be_valid
    end

    #descriptionの文字が1000文字以上と以下の場合
    it "is invalid description is too long maximum 40 characters" do
        item = build(:item, description: "a" * 1001)
        item.valid?
        expect(item.errors[:description]).to include("は1000文字以内で入力してください")
    end

    it "is valid with a description that has less than 1000 characters" do
        item = build(:item, description: "a" * 1000)
        expect(item).to be_valid
    end

    #priceが9999999円以上の場合
    it "is invalid price is too much maximum 9999999" do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include("は一覧にありません")
    end

    #priceが9999999円の場合
    it "is valid price is too much maximum 9999999" do
        item = build(:item, price: 9999999)
        expect(item).to be_valid
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
        expect(item).to be_valid
    end

    #brandが無くても保存できる
    it "is valid without a brand" do
        item = build(:item, brand: "")
        expect(item).to be_valid
    end
  end
end