require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Jack', posts_count: 3)
  subject do
    Post.create(title: 'Breaking news', text: 'writing testing in rails', author_id: user.id, comments_count: 3,
                likes_count: 4)
  end

  before { subject.save }

  it 'the title should not be nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'the passed title should be valid' do
    expect(subject).to_not be nil
  end

  it 'comment counter should not be nil' do
    post = Post.create(title: 'Breaking news', text: 'writing testing in rails', author_id: user.id)
    Comment.create(text: 'good work', author_id: user.id, post_id: post.id)
    Comment.create(text: 'Ruby on rails', author_id: user.id, post_id: post.id)
    Comment.create(text: 'good work', author_id: user.id, post_id: post.id)
    expect(post.comments_count).to_not be nil
  end

  it 'check if five_most_recent_comments some values ' do
    subj = Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Comment.create(text: 'good work', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'Ruby on rails', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'good work', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'how are you there?', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'are you done?', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'good bye', author_id: user.id, post_id: subject.id)
    expect(subj.five_most_recent_comments).to_not be nil
  end

  it 'check if five_most_recent_comments return 5 values length' do
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Comment.create(text: 'good work', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'Ruby on rails', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'good work', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'how are you there?', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'are you done?', author_id: user.id, post_id: subject.id)
    Comment.create(text: 'good bye', author_id: user.id, post_id: subject.id)
    expect(subject.five_most_recent_comments.length).to_not be nil
  end

  it 'check if update_post_counter' do
    user = User.create(name: 'Jack', posts_count: 3)
    Post.create(title: 'helllo', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'how are you', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'Fine and you?', text: 'writing testing in rails', author_id: user.id)
    Post.create(title: 'Nice', text: 'writing testing in rails', author_id: user.id)
    expect(user.posts_count).to_not be nil
  end
end
