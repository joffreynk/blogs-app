class PostsController < ApplicationController
  def index
    param_id = params['id'].to_i
    @single_user_found = User.find_by(id: param_id)
    @user_found_posts = Post.where(author_id: param_id)
    @all_comments = Comment.all
  end

  def show
    puts params
    param_id = params['id'].to_i
    param_user_id = params['user_id'].to_i
    @user_found = User.find_by(id: param_user_id)
    @post = Post.find_by(id: param_id)
    @all_comments = Comment.where(post_id: param_id)
  end
end
