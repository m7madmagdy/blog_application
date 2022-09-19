RSpec.describe User, type: :request do
    describe 'DELETE /destroy' do
      context 'with valid parameters' do
        let!(:user_id) { FactoryBot.create(:user) }
  
        before do
          delete "/api/users/#{user_id.id}"
        end
  
        it 'returns a no content status' do
          expect(response).to have_http_status(:no_content)
        end
      end
    end
  end
  