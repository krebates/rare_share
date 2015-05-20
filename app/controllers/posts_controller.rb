class PostsController < ApplicationController
  def create
    @discussion = Discussion.find(post_params[:discussion_id])
    @post = @discussion.posts.build(post_params)

    if @post.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :discussion_id, :user_id)
  end

end
