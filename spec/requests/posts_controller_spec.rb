RSpec.describe 'Posts', type: :request do
  it 'response status is a success' do
    get '/users/29/posts'
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    get '/users/29/posts'
    expect(response).to render_template('index')
  end
end

RSpec.describe 'sigle post', type: :request do
  it 'rsponse status is a success' do
    get '/users/29/posts/56'
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    get '/users/29/posts/56'
    expect(response).to render_template('show')
  end
end

RSpec.describe 'posts and post page contents', type: :feature do
  it 'have here is a list of posts text index.html.erb' do
    visit '/users/29/posts'
    expect(page).to have_text('Title: Ruby From ground')
  end
  it 'have here is a single of post text in show.html.erb' do
    visit '/users/29/posts/56'
    expect(page).to have_text('Lorem ipsum dolor sit amet consectetur adipisicing elit.')
  end
end
