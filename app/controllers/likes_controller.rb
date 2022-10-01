class LikesController < ApplicationController
  def index
    Like.create(author_id: params['author_id'], post_id: params['post_id'])
    redirect_to '/'
  end
end
