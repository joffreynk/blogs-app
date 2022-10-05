class PostsController < ApplicationController
  def index
    param_id = params['id'].to_i

    @single_user_found = User.find_by(id: param_id)
    @user_found_posts = Post.where(author_id: param_id)
    @all_comments = Comment.all

    @post_on_comment = Post.where(author_id: param_id).includes(:comments)
  end

  def show
    puts params
    param_id = params['id'].to_i
    param_user_id = params['user_id'].to_i
    @user_found = User.find_by(id: param_user_id)
    # @posts = Post.find_by(id: param_id)
    @post_with_comments = Post.where(id: param_id).includes(:comments)
  end

  def loadpost; end

  def new
    Post.create(title: params['title'], text: params['message'], author_id: params['author_id'])
    redirect_to '/'
  end
end
