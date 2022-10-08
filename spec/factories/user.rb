FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      email { Faker::Internet.email }
      mobile { Faker::PhoneNumber.cell_phone }
      status { Faker::Lorem.word }
    end
end
  