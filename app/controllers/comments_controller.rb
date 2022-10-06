class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :create, :destroy]

  def index
    @comments = Comment.all
  end

  def create
    @comment = @user.comments.create(comment_params)
    redirect_to root_path
  end

  def edit; end

  def destroy
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def set_comment
    @user = User.find(params[:user_id])
  end
end
