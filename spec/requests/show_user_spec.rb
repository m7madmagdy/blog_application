RSpec.describe User, type: :request do
    describe 'GET /show' do
      context 'with valid parameters' do
        let!(:user_id) { FactoryBot.create(:user) }
  
        before do
          get "/api/users/#{user_id.id}"
        end
  
        it 'returns a success status' do
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
  
  