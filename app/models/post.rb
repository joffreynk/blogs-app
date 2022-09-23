class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { in: 1..250 }
  validates_numericality_of :likes_counter, greater_than_or_equal_to: 0
  validates_numericality_of :comments_counter, greater_than_or_equal_to: 0

  after_create :update_post_counter

  after_initialize do |post|
    post.likes_counter = 0
    post.comments_counter = 0
  end

  def update_post_counter
    author.increment(:post_counter)
  end

  def five_most_recent_comments
    comments.order(updated_at: :desc).limit(5)
  end
end
