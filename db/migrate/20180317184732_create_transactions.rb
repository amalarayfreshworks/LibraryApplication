class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions, id: false do |t|
      t.primary_key :transaction_id
      t.datetime :issue_date_time
      t.datetime :due_date_time
      t.datetime :returned_date
      t.float :late_fee
      t.boolean :returned
      t.belongs_to :book, foreign_key: true
      t.belongs_to :reader, foreign_key: true
      t.timestamps
    end
  end
end
