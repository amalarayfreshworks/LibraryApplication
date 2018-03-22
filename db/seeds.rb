# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Transaction.delete_all
# Reader.delete_all
Reader.create!(reader_id: 1, reader_name: 'Amala Ray', reader_mobile_num: 8056286205 ,reader_email: 'amala.ray@gmail.com',membership_start_date: Time.now, membership_end_date: Time.now+1.years)
Reader.create!(reader_id: 2, reader_name: 'Anupama Kumari', reader_mobile_num: 9055676205 ,reader_email: 'anupama@gmail.com', membership_start_date: Time.now, membership_end_date: Time.now+1.years)
Reader.create!(reader_id: 3, reader_name: 'Lavanya', reader_mobile_num: 6036286208 ,reader_email: 'lavanya@gmail.com', membership_start_date: Time.now, membership_end_date: Time.now+1.years)
Reader.create!(reader_id: 4, reader_name: 'Soorya', reader_mobile_num: 7756286215 ,reader_email: 'soorya@gmail.com', membership_start_date: Time.now, membership_end_date: Time.now+1.years)
Reader.create!(reader_id: 5, reader_name: 'Selva', reader_mobile_num: 9006286206 ,reader_email: 'selva@gmail.com', membership_start_date:  Time.now, membership_end_date: Time.now+1.years)
Reader.create!(reader_id: 6, reader_name: 'Saravanan', reader_mobile_num: 8012286678 ,reader_email: 'saravanan@gmail.com', membership_start_date: Time.now, membership_end_date: Time.now+1.years)


# Book.delete_all
Book.create!(book_id: 1, book_name: 'OCJP Java Proffesional 7',book_category: 'Educational', book_avail_in_lib: true, book_damaged: false)
Book.create!(book_id: 2, book_name: 'AWS Developer Associate',book_category: 'Educational', book_avail_in_lib: true, book_damaged: false)
Book.create!(book_id: 3, book_name: 'Euclidion Mathematics',book_category: 'Educational', book_avail_in_lib: true, book_damaged: false)
Book.create!(book_id: 4, book_name: 'Make in India',book_category: 'Politics', book_avail_in_lib: true, book_damaged: false)
Book.create!(book_id: 5, book_name: 'Indian Politics',book_category: 'Educational', book_avail_in_lib: true, book_damaged: false)
Book.create!(book_id: 6, book_name: 'Inheritance of Loss',book_category: 'Philosophical', book_avail_in_lib: true, book_damaged: false)



Transaction.create!(transaction_id: 1, issue_date_time: Time.now + 1.days, due_date_time: Time.now + 7.days, late_fee: 0, reader_id: 1, book_id: 1)