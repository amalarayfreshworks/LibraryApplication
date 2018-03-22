json.extract! transaction, :id, :transaction_id, :issue_date_time, :book_id, :reader_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
