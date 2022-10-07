class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    param_id = params['id'].to_i
    @user_posts = User.where(id: param_id).includes(:posts) # .where(:posts.limit(3))
  end
end
