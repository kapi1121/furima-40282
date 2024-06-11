FactoryBot.define do
  factory :purchase_shipping do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { 'Tokyo' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    item_id { create(:item).id }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
