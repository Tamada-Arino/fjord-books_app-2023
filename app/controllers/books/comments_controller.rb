# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable

  private

  def render_commentable_show
    @book = @commentable
    render 'books/show'
  end
end
