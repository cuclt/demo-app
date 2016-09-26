class CommentsController < ApplicationController
  def create
    @micropost = Micropost.find_by id: params[:id]
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @micropost
    else
      flash.now[:danger] = "Error"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :micropost_id)
    end
end
