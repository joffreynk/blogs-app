require 'rails_helper'

RSpec.describe 'single user page contents', type: :feature do
  describe 'GET /users/:id' do
    before do
      user2 = User.create(name: 'Kenobi')
      visit "/users/#{user2.id}"
    end
    it 'have here is a single of user text in show.html.erb' do
      expect(page).to have_text("user Name")
    end
  end
end