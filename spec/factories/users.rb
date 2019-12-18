FactoryBot.define do

  factory :user do
    nickname              {"山田"}
    email                 {"kkk@gmail.com"}
    password              {"yyy00000"}
    family_name_kanji     {"山田"}
    first_name_kanji      {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"太郎"}
    birthdata_year        {"2019"}
    birthdata_month       {"12"}
    birthdata_day         {"18"}
    phone_number          {"08056784321"}
  end

end