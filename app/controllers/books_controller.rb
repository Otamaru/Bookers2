class BooksController < ApplicationController

  def create
   @book_new = Book.new(book_params)
   @book_new.user_id = current_user.id
   @book_new.save
   redirect_to books_path

  end

  def index
    @book_new = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

 def edit
   @book = Book.find(params[:id])
 end

 def update
   @book_new = Book.find(params[:id])
   @book_new.update(book_params)
   redirect_to book_path(book.id)
 end

 def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
 end


  private

  def book_params
     params.require(:book).permit(:title, :body)
  end
end
