RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before do
      get '/'
    end
    it 'rsponse status is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
end

RSpec.describe 'sigle user', type: :request do
  describe 'GET /users/:id' do
    before do
      user = User.create(name: 'Kenobi')
      get "/users/#{user.id}"
    end
    it 'rsponse status is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('show')
    end
  end
end


