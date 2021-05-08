class BookCommentsController < ApplicationController
  def create
    @book=Book.find(params[:book_id])
    @book_comments=@book.book_comments.new(book_comment_params)
    @book_comments.user_id=current_user.id
    @book_comment=@book.book_comments
    if @book_comments.save
      render :index
    end
  end

  def destroy
    @book_comment=BookComment.find(params[:id])
    if @book_comment.destroy
      render :index
    end
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment, :book_id, :user_id)
  end

end
