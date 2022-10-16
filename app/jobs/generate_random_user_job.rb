class GenerateRandomUserJob < ApplicationJob
  queue_as :default

  def perform
    user = User.new
    user.name = Faker::Name.name
    user.email = Faker::Internet.email
    user.mobile = Faker::PhoneNumber.cell_phone
    user.status = random_status
    user.save!
    sleep 8
  end

  def random_status
    User::VALID_STATUSES.sample
  end

end
