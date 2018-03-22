class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books, id: false do |t|
      t.primary_key :book_id
      t.string :book_name
      t.string :book_desc
      t.string :book_category
      t.boolean :book_avail_in_lib
      t.boolean :book_damaged

      t.timestamps
    end
  end
end
