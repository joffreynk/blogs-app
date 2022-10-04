require 'rails_helper'

RSpec.describe 'Posts and post page contents', type: :feature do
  describe 'GET /po' do
    before do
      user = User.create(name: 'Kenobi', photo: 'https://media-exp1.licdn.com/dms/image/C5603AQEorOMBwfw12Q/profile-displayphoto-shrink_800_800/0/1658935548161?e=1669852800&v=beta&t=-oXG15LnHsYblzaPx9vJBJzDLxnH3x__asev4ezUv9g')
      Post.create(title: 'Breaking news', text: 'writing testing in rails', author_id: user.id, comments_count: 3,
        likes_count: 4)
      visit "/users/#{user.id}/posts"
    end
    it 'should have a post with title' do
      expect(page).to have_text('Breaking news')
    end
    it 'the page should a user username' do
      expect(page).to have_text('Kenobi')
    end
    it 'should have a post with text' do
      expect(page).to have_text('writing testing in rails')
    end
  end
end
