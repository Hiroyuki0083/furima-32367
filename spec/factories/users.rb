FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 {Faker::Internet.free_email}
    name                  { 'プル' }
    lastname              { 'サン' }
    name_furigana         { 'プル' }
    lastname_furigana     { 'サン' }
    birthday              { '1930-01-01' }
    password              { '123qwe' }
    password_confirmation { '123qwe' }
  end
end
