RSpec.describe User, type: :request do
    describe 'POST /create' do
      context 'with valid parameters' do
        let!(:user_id) { FactoryBot.create(:user) }
  
        before do
          post '/api/users', params:
            { user: { 
                name: user_id.name,
                email: user_id.email,
                mobile: user_id.mobile
            } }
        end
  
        it 'returns a created status' do
          expect(response).to have_http_status(:created)
        end
      end
    end
end
  