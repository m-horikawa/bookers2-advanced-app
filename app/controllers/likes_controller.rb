class LikesController < ApplicationController
  before_action :set_book

  def create
    @like = Like.create(user_id: current_user.id, book_id: @book.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, book_id: @book.id)
    @like.destroy
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end
end

