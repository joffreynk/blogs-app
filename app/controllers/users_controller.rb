class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  # User.includes(:most_recent_comments).first.most_recent_comments # => returns all associated comments.

  def show
    param_id = params['id'].to_i

     @user_posts = User.where(id:param_id).includes(:posts)
    # @user_posts = User.where(id:param_id).includes(:most_recent_posts).first.most_recent_posts


    @user_to_find = User.find_by(id: param_id)
    @user_found_posts = Post.where(author_id: param_id)
  end
end
