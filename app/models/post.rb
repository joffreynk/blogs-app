class Post < ApplicationRecord
  belongs_to :user
  def self.updateusercount
    user = User.find_by(id:  self.author_id)
    user.update(post_counter: Post.where(id: self.author_id).count)
  end

  def list_last_comment
    Comment.where(post_id: self.id).last(limit = 3)
  end
end
