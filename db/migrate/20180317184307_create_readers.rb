class CreateReaders < ActiveRecord::Migration[5.1]
  def change
    create_table :readers , id: false do |t|
      t.primary_key :reader_id
      t.string :reader_name
      t.string :reader_mobile_num
      t.string :reader_email
      t.datetime :membership_start_date
      t.datetime :membership_end_date
      t.timestamps
    end
  end
end
