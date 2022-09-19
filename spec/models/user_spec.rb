RSpec.describe User, type: :model do
  context '#validations' do
    it { is_expected.to have_one(:comment).dependent(:destroy) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:mobile) }
  end
end
