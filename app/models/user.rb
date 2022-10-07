class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  # has_many :most_recent_posts, -> { order('created_at DESC').limit(2) }, class_name: 'Post'

  # validates :name, presence: true
  validates_numericality_of :posts_count, greater_than_or_equal_to: 0

  after_initialize do |user|
    user.posts_count = 0
  end

  def last_three_posts
    Post.where(author: self).order(updated_at: :desc).first(3)
  end
end
