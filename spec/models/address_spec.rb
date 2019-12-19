require 'rails_helper'
describe Address do
  describe '#create' do
    it "family_nameが空では登録できないこと" do
      address = build(:address, family_name: "")
      address.valid?
      expect(address.errors[:family_name]).to include("can't be blank")
    end
    it "first_nameが空では登録できないこと" do
      address = build(:address, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("can't be blank")
    end
    it "family_name_katakanaが空では登録できないこと" do
      address = build(:address, family_name_katakana: "")
      address.valid?
      expect(address.errors[:family_name_katakana]).to include("can't be blank")
    end
    it "first_name_katakanaが空では登録できないこと" do
      address = build(:address, first_name_katakana: "")
      address.valid?
      expect(address.errors[:first_name_katakana]).to include("can't be blank")
    end
    it "postcodeが空では登録できないこと" do
      address = build(:address, postcode: "")
      address.valid?
      expect(address.errors[:postcode]).to include("can't be blank")
    end
    it "prefectureが空では登録できないこと" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end
    it "cityが空では登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end
    it "blockが空では登録できないこと" do
      address = build(:address, block: "")
      address.valid?
      expect(address.errors[:block]).to include("can't be blank")
    end
    it "buildingが空では登録できないこと" do
      address = build(:address, building: "")
      address.valid?
      expect(address.errors[:building]).to include("can't be blank")
    end
    it "telephone_numberが空では登録できないこと" do
      address = build(:address, telephone_number: "")
      address.valid?
      expect(address.errors[:telephone_number]).to include("can't be blank")
    end

    it "family_name_katakanaがカタカナ以外では登録できないこと" do
      address = build(:address, family_name_katakana: "あ")
      address.valid?
      expect(address.errors[:family_name_katakana]).to include("is invalid")
    end

    it "first_name_katakanaがカタカナ以外では登録できないこと" do
      address = build(:address, first_name_katakana: "あ")
      address.valid?
      expect(address.errors[:first_name_katakana]).to include("is invalid")
    end
  end
end