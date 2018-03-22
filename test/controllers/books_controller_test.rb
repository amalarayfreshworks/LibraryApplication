require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
        include Elasticsearch::Model
        include Elasticsearch::Model::Callbacks
  setup do
          Book.delete_all
          Book.__elasticsearch__.create_index! force: true
          ::Book.create! book_name: 'Test',           book_desc: '', book_id: 1
          ::Book.create! book_name: 'Testing Coding', book_desc: '', book_id: 2
          ::Book.create! book_name: 'Coding',         book_desc: '', book_id: 3
          Book.__elasticsearch__.refresh_index!
    @book = books(:one)
    puts "book id is #{@book.book_id}"
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { book_category: @book.book_category, book_id: @book.book_id+22, book_name: @book.book_name } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book, from_search: false)
    assert_response :success
  end

  test "should update book" do
    puts "in test"
    bookupdatetest = Book.find @book.book_id
    puts "in test the id is #{bookupdatetest.book_id}"
    patch book_url(@book), params: { book: { book_category: @book.book_category, book_id: @book.book_id, book_name: @book.book_name } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
