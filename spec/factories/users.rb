FactoryBot.define do

  factory :user do
    id                    {4}
    nickname              {"山田"}
    email                 {"kkk@gmail.com"}
    password              {"yyy00000"}
    family_name_kanji     {"山田"}
    first_name_kanji      {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthdata_year        {"2019"}
    birthdata_month       {"12"}
    birthdata_day         {"18"}
    phone_number          {"08056784321"}
    created_at            {"2019-12-30 21:47:58"}
    updated_at            {"2019-12-30 21:47:58"}
  end

end