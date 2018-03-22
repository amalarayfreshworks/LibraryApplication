json.extract! book, :id, :book_id, :book_name, :book_category, :created_at, :updated_at
json.url book_url(book, format: :json)
