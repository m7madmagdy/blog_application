class CommentsController < ApplicationController
  before_action :set_comment, only: [:create, :destroy]

  def index
    @comments = Comment.all
  end

end
