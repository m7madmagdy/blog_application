RSpec.describe User, type: :model do
  context '#relations' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  context '#validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:mobile) }
    it { is_expected.to validate_inclusion_of(:status).in_array(User::VALID_STATUSES) }
  end

end
