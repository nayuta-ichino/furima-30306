FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    last_name              { Faker::Japanese::Name.last_name }
    first_name             { Faker::Japanese::Name.first_name }
    last_name_kana         { Gimei.name.last.katakana }
    first_name_kana        { Gimei.name.first.katakana }
    birthday               { Faker::Date.birthday(min_age: 1, max_age: 100) }
  end
end
