class PostsController < ApplicationController
  def create
    @discussion = Discussion.find(post_params[:discussion_id])
    @post = @discussion.posts.build(post_params)

    if @post
      @post.save
    else
      redirect_to :back
    end
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:body, :discussion_id)
  end

end
