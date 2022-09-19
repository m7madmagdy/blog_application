RSpec.describe User, type: :request do
  describe "GET /index" do
    before do
      get '/api/users'
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end

# RSpec.describe PostsController, type: :routing do
#   describe 'routing' do
#     # index
#     it 'routes GET /posts to posts#index' do
#       expect(get: '/posts').to route_to 'posts#index'
#     end
    
#     # show
#     it 'routes GET /posts/1 to posts#show' do
#       expect(get: '/posts/1').to route_to 'posts#show', id: '1'
#     end
    
#     # new
#     it 'routes GET /posts/new to posts#new' do
#       expect(get: '/posts/new').to route_to 'posts#new'
#     end
    
#     # edit
#     it 'routes GET /posts/1/edit to posts#edit' do
#       expect(get: '/posts/1/edit').to route_to 'posts#edit', id: '1'
#     end
    
#     # create
#     it 'routes POST /posts to posts#create' do
#       expect(post: '/posts').to route_to 'posts#create'
#     end
    
#     # update
#     it 'routes PATCH /posts/1 to posts#update' do
#       expect(patch: '/posts/1').to route_to 'posts#update', id: '1'
#     end

#     it 'routes PUT /posts/1 to posts#update' do
#       expect(put: '/posts/1').to route_to 'posts#update', id: '1'
#     end
    
#     # destroy
#     it 'routes DELETE /posts/1 to posts#destroy' do
#       expect(delete: '/posts/1').to route_to 'posts#destroy', id: '1'
#     end
#   end
# end