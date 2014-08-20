require 'spec_helper'

describe TicketDetail do
  before { @ticketdetail = TicketDetail.new(from: 'here', to: 'there', journey_date: "2014-12-20", direction: "One Way") }

  subject { @ticketdetail }
  it { should respond_to(:from) }
  it { should respond_to(:to) }
  it { should respond_to(:journey_date) }
  it { should respond_to(:direction) }

  it { should be_valid }
  describe "when from is not present" do
    before { @ticketdetail.from = " " }
    it { should_not be_valid }
  end

  describe "when from is too long" do
    before { @ticketdetail.from = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when to is not present" do
    before { @ticketdetail.to = " " }
    it { should_not be_valid }
  end

  describe "when to is too long" do
    before { @ticketdetail.to = "a"* 51 }
    it { should_not be_valid }
  end
  
  describe "when date is not present" do
    before { @ticketdetail.journey_date = " " }
    it { should_not be_valid }
  end
    
    describe  "when direction is not present" do
      before { @ticketdetail.direction = " " }
      it { should_not be_valid }
    end
end
