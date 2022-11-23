class BooksController < ApplicationController
  def show
    @book = Book.new #New bookの所の@book
    @user = current_user #User infoの所の@user
    @booker = Book.find(params[:id]) #Book detailで使用
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id #redirect_to book_path(@book.id)の際に必要
    @book.save
    @user = current_user #User infoの所の@user
    # @books = Book.all
    redirect_to book_path(@book.id), notice: "You have created book successfully."
  end

  def index
    @book = Book.new #New book,Book detailの所の@book
    @books = Book.all
    @user = current_user #User infoの所の@user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), notice: "You have updated book successfully."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end