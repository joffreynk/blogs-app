require 'rails_helper'

RSpec.describe 'Users and user page contents', type: :feature do
  describe 'GET /' do
    before do
      @user = User.create(name: 'Kenobi', photo: 'https://media-exp1.licdn.com/dms/image/C5603AQEorOMBwfw12Q/profile-displayphoto-shrink_800_800/0/1658935548161?e=1669852800&v=beta&t=-oXG15LnHsYblzaPx9vJBJzDLxnH3x__asev4ezUv9g')
      visit '/'
    end
    it 'have here is a list of users text index.html.erb' do
      expect(page).to have_text('List of users')
    end
    it 'test user' do
      expect(page).to have_text('Kenobi')
    end

    it 'Check if click on user redirects to user page' do
      visit '/'
      within('ul') do
        find("#user#{@user.id}", visible: :all).click
      end
      expect(page).to have_current_path("/users/#{@user.id}")
    end

    it 'test existance of image' do
      expect(page.find("#img#{@user.id}", visible: :all)['src']).to_not be nil
    end
  end
end
