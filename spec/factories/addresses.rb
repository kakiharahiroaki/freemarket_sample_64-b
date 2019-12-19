FactoryBot.define do
  factory :address do
    family_name               {"山田"}
    first_name                {"太郎"}
    family_name_katakana      {"ヤマダ"}
    first_name_katakana       {"タロウ"}
    postcode                  {"3212345"}
    prefecture                {"city"}
    block                     {"block"}
    building                  {"building"}
    telephone_number          {"telephone_number"}
  end
end
