class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  def self.updatepostcommentcount
    post = Post.find_by(id:  self.post_id)
    post.update(comments_counter: Post.where(id: self.post_id).count)
  end
end
