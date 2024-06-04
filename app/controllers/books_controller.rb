class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(book.id)
    else
      @book = Book.new
      @books = Book.all
      flash.now[:notice] = "投稿に失敗しました。"
      render :index
    end



  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(book.id)
    else
      @book = Book.find(params[:id])
      flash.now[:notice] = "投稿に失敗しました。"
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
    params.require(:book).permit(:title, :body)
  end
end
