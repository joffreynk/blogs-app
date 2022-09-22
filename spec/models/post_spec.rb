require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Jack', post_counter:3)
  subject { Post.create(title:'Breaking news', text:'writing testing in rails', author_id: user.id, comments_counter: 3, likes_counter: 4) }

  before {subject.save}

  it 'the title should not be nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'the passed title should be valid' do
    expect(subject).to be_valid
  end

  it 'comment counter should not be nil' do
    post = Post.create(title:'Breaking news', text:'writing testing in rails', author_id: user.id)
    expect(post.comments_counter).to_not be nil
  end

  it 'check if five_most_recent_comments some values ' do
    subject = Post.create(title:'helllo', text:'writing testing in rails', author_id: user.id)
    comment1 = Comment.create(text:'good work', author_id: user.id, post_id: subject.id)
    comment2 = Comment.create(text:'Ruby on rails', author_id: user.id, post_id: subject.id)
    comment3 = Comment.create(text:'good work', author_id: user.id, post_id: subject.id)
    comment4 = Comment.create(text:'how are you there?', author_id: user.id, post_id: subject.id)
    comment5 = Comment.create(text:'are you done?', author_id: user.id, post_id: subject.id)
    comment6 = Comment.create(text:'good bye', author_id: user.id, post_id: subject.id)
    expect(subject.five_most_recent_comments).to_not be nil
  end


  it 'check if five_most_recent_comments return 5 values length' do
    subject = Post.create(title:'helllo', text:'writing testing in rails', author_id: user.id)
    comment1 = Comment.create(text:'good work', author_id: user.id, post_id: subject.id)
    comment2 = Comment.create(text:'Ruby on rails', author_id: user.id, post_id: subject.id)
    comment3 = Comment.create(text:'good work', author_id: user.id, post_id: subject.id)
    comment4 = Comment.create(text:'how are you there?', author_id: user.id, post_id: subject.id)
    comment5 = Comment.create(text:'are you done?', author_id: user.id, post_id: subject.id)
    comment6 = Comment.create(text:'good bye', author_id: user.id, post_id: subject.id)
    expect(subject.five_most_recent_comments.length).to be 5
  end

  it 'check if update_post_counter' do
    user = User.create(name: 'Jack', post_counter:0)
    post1 = Post.create(title:'helllo', text:'writing testing in rails', author_id: user.id)
    post2 = Post.create(title:'how are you', text:'writing testing in rails', author_id: user.id)
    post3 = Post.create(title:'Fine and you?', text:'writing testing in rails', author_id: user.id)
    post4 = Post.create(title:'Nice', text:'writing testing in rails', author_id: user.id)
    expect(post4.update_post_counter).to_not be nil
  end

end