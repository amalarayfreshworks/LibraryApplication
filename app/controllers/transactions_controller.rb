class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @book = Book.find(@transaction.book_id)
    @reader = Reader.find(@transaction.reader_id)
    @transaction.book = @book
    @transaction.reader = @reader
    @transaction.due_date_time = @transaction.issue_date_time + 10.days
    @book.book_avail_in_lib = false

    respond_to do |format|
      if @transaction.save && @book.update(@book.attributes)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # RENEW /transactions/1
  # RENEW /transactions/1.json
  def renew
     @transaction = Transaction.new(transaction_params)
     @transaction.due_date_time+= 10.days
       if @transaction.update(@transaction.attrubutes)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
  end

  def return_book
     @transaction = Transaction.new(transaction_params)
     @book = Book.find(transaction.book_id)
     @transaction.returned_date = Time.now;
     @transaction.returned = true
     @book.book_avail_in_lib = true
     respond_to do |format|
      if @transaction.update(transaction_params) && @book.update(@book.attributes)
        format.html { redirect_to transactions_url, notice: 'Book has been returned.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
=begin
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end

=end
     return_book
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:transaction_id, :issue_date_time, :due_date_time,:late_fee,:book_id, :reader_id)
    end
end
