FactoryBot.define do
    factory :comment do
        commenter { Faker::Name.name }
        body { Faker::Lorem.paragraph }
        status { Faker::Lorem.word }
    end
end
  