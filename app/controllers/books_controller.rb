class BooksController < ApplicationController
  def show
    @book = Book.new #New bookの所の@book
    @user = current_user #User infoの所の@user
    @booker = Book.find(params[:id]) #Book detailで使用
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new #New bookの所の@book
    @books = Book.all
    @user = current_user #User infoの所の@user
  end

  def edit
    @book = Book.find(params[:id])
    if @user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
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