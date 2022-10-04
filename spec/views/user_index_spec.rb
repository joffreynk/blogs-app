require 'rails_helper'

RSpec.describe 'check user image', type: :feature do
  it 'rsponse img id is a success' do
    visit '/'
    expect(page.find('#image12')['src']).to_not be nil
  end
end