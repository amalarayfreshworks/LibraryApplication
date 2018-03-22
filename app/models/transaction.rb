class Transaction < ApplicationRecord
  belongs_to :book
  belongs_to :reader
  validate :issue_date_cannot_be_in_the_past
  validates :book_id , presence: :true
  validates :reader_id , presence: :true

  def issue_date_cannot_be_in_the_past
    if !issue_date_time.blank? and issue_date_time < Time.now 
      errors.add(:issue_date_time, "Issue date can't be in the past")
    end
  end
end
