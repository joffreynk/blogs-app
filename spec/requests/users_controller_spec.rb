RSpec.describe 'Users', type: :request do
  it 'rsponse status is a success' do
    get '/'
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    get '/'
    expect(response).to render_template('index')
  end
end

RSpec.describe 'sigle user', type: :request do
  it 'rsponse status is a success' do
    get '/users/:id'
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    get '/users/:id'
    expect(response).to render_template('show')
  end
end

RSpec.describe 'Users and user page contents', type: :feature do
  it 'have here is a list of users text index.html.erb' do
    visit '/'
    expect(page).to have_text('List of users')
  end
  it 'have here is a single of user text in show.html.erb' do
    visit '/users/:id'
    expect(page).to have_text('posts')
  end
end
