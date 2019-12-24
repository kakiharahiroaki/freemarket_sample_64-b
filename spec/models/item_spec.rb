require 'rails_helper'

describe Item do
    describe '#create' do

    it "productsが空では出品ができないこと" do
        item = build(:item, products: "")
        item.valid?
        expect(item.errors[:products]).to include("can't be blank")
    end

    it "description_of_itemが空では出品できないこと" do
        item = build(:item, description_of_item: "")
        item.valid?
        expect(item.errors[:description_of_item]).to include("can't be blank")
    end

    it "priceが空では出品できないこと" do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
    end

    it "sizeが空では出品できないこと" do
        item = build(:item, size: "")
        item.valid?
        expect(item.errors[:size]).to include("can't be blank")
    end

    it "shipping_dateが空では出品できないこと" do
        item = build(:item, shipping_date: "")
        item.valid?
        expect(item.errors[:shipping_date]).to include("can't be blank")
    end

    it "shipping_methodが空では出品できないこと" do
        item = build(:item, shipping_method: "")
        item.valid?
        expect(item.errors[:shipping_method]).to include("can't be blank")
    end

    it "postageが空では出品できないこと" do
        item = build(:item, postage: "")
        item.valid?
        expect(item.errors[:postage]).to include("can't be blank")
    end

    it "shipping_originが空では出品できないこと" do
        item = build(:item, shipping_origin: "")
        item.valid?
        expect(item.errors[:shipping_origin]).to include("can't be blank")
    end

    it "user_idが空では出品できないこと" do
        item = build(:item, user_id: "")
        item.valid?
        expect(item.errors[:user_id]).to include("can't be blank")
    end

    
    it "productsが40文字以上だと出品できないこと" do
        item = build(:item, products: "a" * 41)
        item.valid?
        expect(item.errors[:products]).to include("is too long (maximum is 40 characters)")
    end


    it "description_of_itemが1000文字以上だと出品できないこと" do
        item = build(:item, description_of_item: "a" * 1001)
        item.valid?
        expect(item.errors[:description_of_item]).to include("is too long (maximum is 1000 characters)")
    end

    it "priceが9999999以上だと出品できないこと" do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include("is not included in the list")
    end

    it "priceが300円以下だと出品できないこと" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("is not included in the list")
    end


  end
end