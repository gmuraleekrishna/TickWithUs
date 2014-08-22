class TicketDetail < ActiveRecord::Base
  validates :from, presence: true, length: { maximum: 50 }
  validates :to, presence: true, length: { maximum: 50 }
  VALID_DATE_REGEX = /\d{4}\-\d{1,2}\-\d{1,2}/
  validates :journey_date, presence: true, format: { with: VALID_DATE_REGEX } 
  validates :direction, presence: true, inclusion: { in: ["one way", "two way"]}

end
