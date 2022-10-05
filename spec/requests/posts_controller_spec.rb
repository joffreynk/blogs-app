# RSpec.describe 'Posts', type: :request do
#   describe 'GET /posts' do
#     before do
#       user = User.create(name: 'Kenobi')
#       post = Post.create(title: 'The Revenge of the Sith', text: 'Text for testing', author_id: user.id)
#       get "/users/#{user.id}/posts/#{post.id}/"
#     end
#     it 'response status is a success' do
#       expect(response).to have_http_status(:ok)
#     end
#     it "renders 'index' template" do
#       expect(response).to render_template('show')
#     end
#   end
# end

# RSpec.describe 'sigle post', type: :request do
#   describe 'GET /posts/:id' do
#     before do
#       user = User.create(name: 'Kenobi')
#       Post.create(title: 'The Revenge of the Sith', text: 'Text for testing', author_id: user.id)
#       get "/users/#{user.id}/posts/#{post.id}"
#     end
#     it 'rsponse status is a success' do
#       expect(response).to have_http_status(:ok)
#     end
#     it "renders 'index' template" do
#       expect(response).to render_template('show')
#     end
#   end
# end


RSpec.describe 'Posts', type: :request do
  describe 'GET /posts/:id' do
    before do
      user = User.create(name: 'Kenobi')
      Post.create(title: 'The Revenge of the Sith', text: 'Text for testing', author_id: user.id)
      get "/users/#{user.id}/posts/"
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
      userx = User.create(name: 'Kenobi')
      postx = Post.create(title: 'The Revenge of the Sith', text: 'Text for testing', author_id: userx.id)
      get "/users/#{userx.id}/posts/#{postx.id}/"
    end
    it 'rsponse status is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('show')
    end
  end
end

RSpec.describe 'posts and post page contents', type: :feature do
  describe 'GET /posts/:id' do
    before do
      userx = User.create(name: 'Kenobi')
      postx = Post.create(title: 'The Revenge of the Sith', text: 'Text for testing', author_id: userx.id)
      visit "/users/#{userx.id}/posts/"
    end
    it 'test the title of the post on post index UI' do
      expect(page).to have_text('The Revenge of the Sith')
    end
  end

  describe 'GET /posts/:id' do
    before do
      userx = User.create(name: 'Kenobi')
      postx = Post.create(title: 'The Revenge of the Sith', text: 'Text for testing', author_id: userx.id)
      visit "/users/#{userx.id}/posts/#{postx.id}/"
    end
    it 'test text descritpion on post' do
      expect(page).to have_text('Text for testing')
    end
  end
end