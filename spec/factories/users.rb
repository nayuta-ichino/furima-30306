FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    last_name              { Faker::Name.initials('ja_JP') }
    first_name             { Faker::Name.initials('ja_JP') }
    last_name_kana         { Faker::Name.initials('ja_JP') }
    first_name_kana        { Faker::Name.initials('ja_JP') }
    birthday               { Faker::Date.birthday(min_age: 1, max_age: 100) }
  end
end
