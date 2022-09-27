RSpec.describe 'Posts', type: :request do
  it "rsponse status is a success" do
    get '/users/:id/posts'
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    get '/users/:id/posts'
    expect(response).to render_template('index')
  end
end

RSpec.describe 'sigle post', type: :request do
  it "rsponse status is a success" do
    get '/users/:id/posts/:id'
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    get '/users/:id/posts/:id'
    expect(response).to render_template('show')
  end
end

RSpec.describe 'posts and post page contents', type: :feature do
  it "have here is a list of posts text index.html.erb" do
    visit '/users/:id/posts'
    expect(page).to have_text('here is a list of posts')
  end
  it "have here is a single of post text in show.html.erb" do
    visit '/users/:id/posts/:id'
    expect(page).to have_text('here is a single post')
  end
end
