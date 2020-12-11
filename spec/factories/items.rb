FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.characters(number: 40)}
    explanation        {Faker::Lorem.characters(number: 1000)}
    category_id        {2}
    status_id          {2}
    delivery_fee_id    {2}
    shipping_area_id   {2}
    days_to_ships_id   {2}
    price              {Faker::Commerce.price(range: 300..9999999, as_string: true)}
    association :user

     after(:build) do |item|
       item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
     end
  end
end
