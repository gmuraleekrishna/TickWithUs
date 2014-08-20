FactoryGirl.define do
  factory :ticket_detail do
    from          "Kerala"
    to            "Banglore"
    journey_date  "10/16/2014"
    round_trip    true
  end
end
