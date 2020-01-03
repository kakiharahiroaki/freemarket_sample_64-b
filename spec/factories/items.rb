FactoryBot.define do
  factory :item do

id                    {1}
user_id               {4}
products              {"シャツ"}
description_of_item   {"返品受け付けません"}
price                 {"3000"}
category              {1}
size                  {12}
shipping_date         {1}
shipping_method       {2}
postage               {1}
shipping_origin       {3}
condition             {1}
association :user, factory: :user

  end
end