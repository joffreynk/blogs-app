class PostsController < ApplicationController
  def index
    id = params['id'].to_i
    @user_found = User.find_by(id:)
    @user_found_posts = Post.where(author_id: id)
    @all_comments = Comment.all
  end

  def show
    id = params['id'].to_i
    user_id = params['user_id'].to_i
    @user_found = User.find_by(id: user_id)
    @post = Post.find_by(id:)
    @all_comments = Comment.where(post_id: id)
  end
end
