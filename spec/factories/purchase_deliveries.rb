FactoryBot.define do
  factory :purchase_delivery do
    postal_code        {'123-4567'}
    shipping_area_id   {2}
    municipalities     {'東京都'}
    address            {'青山1-1-1'}
    phone_number       {'01234567890'}
    building_name      {'東京ハイツ'}
    user_id            {1}
    item_id            {1}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end
