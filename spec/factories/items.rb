FactoryBot.define do
  factory :item do
    name { 'テスト' }
    description { 'これはテストです。' }
    category_id { 2 }
    price { 3000 }
    item_status_id { 2 }
    delivery_fee_id            { 2 }
    date_of_shipment_id      { 2 }
    shipping_region_id       { 4 }
    association :user
  end
end
