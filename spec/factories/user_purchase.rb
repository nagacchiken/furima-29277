FactoryBot.define do
  factory :user_purchase do
    token { 4_242_424_242_424_242 }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市板橋区' }
    address { '1-2-3' }
    building_name { '山田アパート102' }
    phone_number { '09012345678' }

    # association :user
  end
end
