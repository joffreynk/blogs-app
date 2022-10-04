RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before do
      user = User.create(name: 'Kenobi')
      post = Post.create(title: 'The Revenge of the Sith', text: "Text for testing", author_id: user.id)
      get "/users/#{user.id}/posts"
    end
    it 'response status is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
end

RSpec.describe 'sigle post', type: :request do
  describe 'GET /posts/:id' do
    before do
      user = User.create(name: 'Kenobi')
      post = Post.create(title: 'The Revenge of the Sith', text: "Text for testing", author_id: user.id)
      get "/users/#{user.id}/posts/#{post.id}"
    end
    it 'rsponse status is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('show')
    end
  end
end

# RSpec.describe 'posts and post page contents', type: :feature do
#   it 'have here is a list of posts text index.html.erb' do
#     visit '/users/29/posts'
#     expect(page).to have_text('Title: Ruby From ground')
#   end
#   it 'have here is a single of post text in show.html.erb' do
#     visit '/users/29/posts/56'
#     expect(page).to have_text('Lorem ipsum dolor sit amet consectetur adipisicing elit.')
#   end
# end
