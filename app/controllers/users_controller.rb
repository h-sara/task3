class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) #Userinfoの所の@user
    @books = @user.books
    @book_user = Book.new
  end

  def index
    @book = Book.new #New book,Book detailの所の@book
    @user = current_user #User infoの所の@user
    @users = User.all #Usersの所の@users
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @user = current_user #User infoの所の@user
    # @books = Book.all
    redirect_to book_path(@book.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end