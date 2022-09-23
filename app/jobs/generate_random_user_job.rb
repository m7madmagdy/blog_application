class GenerateRandomUserJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user = User.new
    user.name = Faker::Name.name
    user.email = Faker::Internet.email
    user.mobile = Faker::PhoneNumber.cell_phone
    user.save!
    sleep 8
  end
end
