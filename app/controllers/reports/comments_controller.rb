class Reports::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def render_commentable_show
    @book = @commentable
    render 'books/show'
  end
end
