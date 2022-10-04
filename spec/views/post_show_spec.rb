require 'rails_helper'

RSpec.describe 'single post page contents', type: :feature do
  describe 'GET /users/:id/posts/:id' do
    before do
      user = User.create(name: 'Kenobi')
      post = Post.create(title: 'Breaking news', text: 'writing testing in rails', author_id: user.id, comments_count: 3,
        likes_count: 4)
      visit "/users/#{user.id}/posts/#{post.id}"
    end
    it 'should have a post with title' do
      expect(page).to have_text('Breaking news')
    end
    
    it 'should have a post with text' do
      expect(page).to have_text('writing testing in rails')
    end
  end
end