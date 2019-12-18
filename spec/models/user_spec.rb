require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it "重複したemailが存在する場合登録できないこと" do
      #はじめにユーザーを登録
      user = create(:user)
      #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "passwordが空では登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "family_name_kanjiが空では登録できないこと" do
      user = build(:user, family_name_kanji: "")
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("can't be blank")
    end

    it "first_name_kanjiが空では登録できないこと" do
      user = build(:user, first_name_kanji: "")
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("can't be blank")
    end

    it "family_name_kanaが空では登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "birthdata_yearが空では登録できないこと" do
      user = build(:user, birthdata_year: "")
      user.valid?
      expect(user.errors[:birthdata_year]).to include("can't be blank")
    end

    it "birthdata_monthが空では登録できないこと" do
      user = build(:user, birthdata_month: "")
      user.valid?
      expect(user.errors[:birthdata_month]).to include("can't be blank")
    end

    it "birthdata_dayが空では登録できないこと" do
      user = build(:user, birthdata_day: "")
      user.valid?
      expect(user.errors[:birthdata_day]).to include("can't be blank")
    end

    it "phone_numberが空では登録できないこと" do
      user = build(:user, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    it "family_name_kanaがカタカナ以外では登録できないこと" do
      user = build(:user, family_name_kana: "あ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end

    it "first_name_kanaがカタカナ以外では登録できないこと" do
      user = build(:user, first_name_kana: "あ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    it "passwordが7文字以下では登録できないこと" do
      user = build(:user, password: "aaa123")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end


  end
end