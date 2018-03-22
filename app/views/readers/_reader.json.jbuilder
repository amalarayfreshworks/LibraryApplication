json.extract! reader, :id, :reader_id, :reader_name, :created_at, :updated_at
json.url reader_url(reader, format: :json)
