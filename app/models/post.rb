class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments

  after_save :update_post_counter

  after_initialize do |post|
    post.likes_counter = 0
    post.comments_counter = 0
  end

  def update_post_counter
    author.increment!(:post_counter)
  end

  def five_most_recent_comments
    comments.order(updated_at: desc).first(5)
  end

  private :update_post_counter
end
