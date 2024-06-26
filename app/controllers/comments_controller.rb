class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[edit update destroy]
  before_action :correct_user?, only: %i[edit update destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      @comments = @commentable.comments
      render_commentable_show
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy

    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end


  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def correct_user?
    redirect_to root_path, alert: t('views.common.unauthorized') unless @comment.user_id == current_user.id
  end
end
