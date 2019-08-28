class BooksController < ApplicationController
  before_action :authenticate_user!
  def top

  end

  def index
  	@books = Book.all
  	@book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end


  def create
  	 book = Book.new(book_params)
     book.user_id = current_user.id
  	 if book.save
     flash[:notice] = "You have creatad book successfully."
  	 redirect_to book_path(book)
    else
      flash[:notice] = "error"
      redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
     flash[:notice] = "You have creatad book successfully."
     redirect_to book_path(book)
   else
     flash[:notice] = "error"
     redirect_to book_path(book.id)
    end
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user.id
      flash[:notice] = "error"
      redirect_to books_path
    end
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
