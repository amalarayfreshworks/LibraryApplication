class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    puts "in show"
    @from_search=params[:from_search]
    @query =params[:query]
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @from_search = params[:from_search]
  end

  def search
    puts "search_books #{params[:search_books]}"
    query = params[:search_books].presence && params[:search_books][:query]
    
    if query
      @books = Book.search_books(query)
    end
  end
  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    
    # @book.book_avail_in_lib = (@book.book_avail_in_lib.eql?"Available" )? true : false;
    # @book.book_damaged = (@book.book_damaged.eql?"Damaged" )? true : false;

    respond_to do |format|
      if @book.save
        flash[:success] = 'Book was successfully created.'
        format.html { redirect_to @book }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    puts "book id is "
    puts "#{book_params['book_id']}"
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    for trans in @book.transactions
       trans.destroy
    end
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:book_id, :book_name,:book_desc, :book_category, :book_avail_in_lib,:book_damaged,:from_edit)
    end
end
