RSpec.describe Comment, type: :model do
    context '#relation' do
        it { is_expected.to belong_to(:user) }
    end

    context '#validations' do
        it { is_expected.to validate_presence_of(:commenter) }
        it { is_expected.to validate_presence_of(:body) }
        it { is_expected.to validate_inclusion_of(:status).in_array(Comment::VALID_STATUSES) }
    end
end
  