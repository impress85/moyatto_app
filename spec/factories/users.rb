FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password = Faker::Alphanumeric.alphanumeric(number: 6)
    password {password}
    nickname  = "tarou" 
  end
end