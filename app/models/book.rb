class Book < ApplicationRecord
	validates :book_name , length:{maximum: 100, minimum: 3}
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
	settings do
	    mappings dynamic: false do
	      indexes :book_name, type: :text
	      indexes :book_category, type: :text, analyzer: :english
	      indexes :book_desc, type: :text, analyzer: :english
	      indexes :book_avail_in_lib, type: :boolean
	      indexes :book_damaged, type: :boolean
	    end
	end
	def self.search_books(query)
	  self.search({
	    query: {
	      bool: {
	        must: [
	        {
	          multi_match: {
	            query: query,
	            fields: [:book_name, :book_desc,:book_category]
	          }
	        },
	        {
	          match: {
	            book_avail_in_lib: true
	          }
	        }]
	      }
	    }
	  })
	end
	has_many :transactions
end
