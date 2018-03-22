class Reader < ApplicationRecord
	validates :reader_name, length: {minimum: 3, maximum: 100}
	validates :reader_mobile_num, length: {minimum: 10, maximum: 10}
	# validates_format_of :reader_email,with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	has_many :transactions
end
