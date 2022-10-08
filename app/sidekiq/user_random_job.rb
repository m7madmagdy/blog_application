class UserRandomJob
  include Sidekiq::Job

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
    %w[public private archived].sample
  end

end