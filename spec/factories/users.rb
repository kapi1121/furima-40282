FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    family_name           { '山田' } 
    personal_name         { '太郎' } 
    family_name_kana      { 'ヤマダ' } 
    personal_name_kana    { 'タロウ' } 
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end