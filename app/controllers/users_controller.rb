class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    id = params['id'].to_i
    @user_to_find = User.find_by(id:)
    @user_found_posts = Post.where(author_id: id)
  end
end
