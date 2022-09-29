class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id, counter_cache: true
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { in: 1..250 }
  validates_numericality_of :likes_count, greater_than_or_equal_to: 0
  validates_numericality_of :comments_count, greater_than_or_equal_to: 0

  after_initialize do |post|
    post.likes_count = 0
    post.comments_count = 0
  end

  def five_most_recent_comments
    comments.order(updated_at: :desc).limit(5)
  end
end
