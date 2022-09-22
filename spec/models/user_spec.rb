require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(name:'Joffrey', post_counter:2)}

  before {subject.save}

  it 'the name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'the passed name should be valid' do
    expect(subject).to be_valid
  end

  it 'post counter should not be nil' do
    user = User.create(name: 'Jack')
    expect(user.post_counter).to_not be nil
  end

  it 'check if last_three_posts return some values' do
    user = User.create(name: 'Jack', post_counter:3)
    post1 = Post.create(title:'helllo', text:'writing testing in rails', author_id: user.id)
    post2 = Post.create(title:'how are you', text:'writing testing in rails', author_id: user.id)
    post3 = Post.create(title:'Fine and you?', text:'writing testing in rails', author_id: user.id)
    post4 = Post.create(title:'Nice', text:'writing testing in rails', author_id: user.id)
    expect(user.last_three_posts).to_not be nil
  end

  it 'check if last_three_posts return 3 values length' do
    user = User.create(name: 'Jack', post_counter:3)
    post1 = Post.create(title:'helllo', text:'writing testing in rails', author_id: user.id)
    post2 = Post.create(title:'how are you', text:'writing testing in rails', author_id: user.id)
    post3 = Post.create(title:'Fine and you?', text:'writing testing in rails', author_id: user.id)
    post4 = Post.create(title:'Nice', text:'writing testing in rails', author_id: user.id)
    expect(user.last_three_posts.length).to be 3
  end

end