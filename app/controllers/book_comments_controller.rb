class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    # @comment = current_user.book_comments.new(book_comment_params)
    @comment = @book.book_comments.build(book_comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    # BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    @book = Book.find(params[:book_id])
    @comment = BookComment.find(params[:id])
    @comment.destroy
    # redirect_to book_path(params[:book_id])
    render :index
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment, :book_id, :user_id)
  end
end
