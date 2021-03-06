class PostsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    return head(:forbidden) unless current_user.admin? ||
                                   current_user.vip? ||
                                   current_user.try(:id) == @post.id
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
