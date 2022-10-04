RSpec.describe 'Posts', type: :request do
  it 'response status is a success' do
    get '/users/12/posts'
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    get '/users/12/posts'
    expect(response).to render_template('index')
  end
end

RSpec.describe 'sigle post', type: :request do
  it 'rsponse status is a success' do
    get '/users/12/posts/17'
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    get '/users/12/posts/17'
    expect(response).to render_template('show')
  end
end

RSpec.describe 'posts and post page contents', type: :feature do
  it 'have here is a list of posts text index.html.erb' do
    visit '/users/12/posts'
    expect(page).to have_text('Title')
  end
  it 'have here is a single of post text in show.html.erb' do
    visit '/users/12/posts/17'
    expect(page).to have_text('Lorem')
  end
end
