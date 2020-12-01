FactoryBot.define do

  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    family_name           {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    family_name_kana      {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    email                 {Faker::Internet.unique.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.birthday}
  end
end