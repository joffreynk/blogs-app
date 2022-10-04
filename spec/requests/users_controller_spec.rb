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

# RSpec.describe 'Users and user page contents', type: :feature do
#   it 'have here is a list of users text index.html.erb' do
#     visit '/'
#     expect(page).to have_text('List of users')
#   end
#   it 'have here is a single of user text in show.html.erb' do
#     visit '/users/29'
#     expect(page).to have_text('user Name: Joffrey')
#   end
# end
