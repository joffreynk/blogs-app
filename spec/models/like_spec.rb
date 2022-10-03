require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Jack')
  post = Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
  subject { Like.create(author_id: user.id, post_id: post.id) }

  before { subject.save }

  it 'the likes should not be nil' do
    expect(subject).to_not be nil
  end

  it 'like counter should not be nil' do
    post1 = Post.create(title: 'Breaking news', text: 'writing testing in rails', author_id: user.id)
    Like.create(post_id:post.id, author_id: user.id)
    Like.create(post_id:post1.id, author_id: user.id)
    expect(post.likes_count).to_not be nil
  end
end
