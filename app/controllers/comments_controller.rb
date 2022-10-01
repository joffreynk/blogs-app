class CommentsController < ApplicationController
  def index
    @commented_post_id = params['id']
  end

  def comment
    Comment.create(text: params['comment'], author_id: params['author_id'], post_id: params['post_id'])

    redirect_to "/users/#{params['author_id']}/posts"
  end
end
