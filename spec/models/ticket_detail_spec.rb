require 'spec_helper'

describe TicketDetail do
  before { @ticketdetail = TicketDetail.new(from: 'here', to: 'there', journey_date: "2014-12-20", direction: "one way") }

  subject { @ticketdetail }
  it { should respond_to(:from) }
  it { should respond_to(:to) }
  it { should respond_to(:journey_date) }
  it { should respond_to(:direction) }

  it { should be_valid }

  describe "from field" do
    describe "when not present" do
      before { @ticketdetail.from = " " }
      it { should_not be_valid }
    end
    describe "is too long" do
      before { @ticketdetail.from = "a" * 51 }
      it { should_not be_valid }
    end
    describe "is correct" do
      before { @ticketdetail.from = "a"* 40 }
      it { should be_valid }
    end

  end

  describe "to field" do
    describe "is not present" do
      before { @ticketdetail.to = " " }
      it { should_not be_valid }
    end
    describe "is too long" do
      before { @ticketdetail.to = "a"* 51 }
      it { should_not be_valid }
    end
    describe "is valid" do
      before { @ticketdetail.to = "a"* 40 }
      it { should be_valid }
    end
  end

  describe "date field" do
    describe "is not present" do
      before { @ticketdetail.journey_date = " " }
      it { should_not be_valid }
    end
    describe "with wrong format" do
       before { @ticketdetail.journey_date = "2458/08/214" }
       it { should_not be_valid }
    end
    describe "with correct format" do
       before { @ticketdetail.journey_date = "2014/08/21" }
       it { should be_valid }
    end
  end

  describe "direction field" do
    describe  "is not present" do
      before { @ticketdetail.direction = " " }
      it { should_not be_valid }
    end
    describe "is wrong value" do
      before { @ticketdetail.direction = "whole way" }
      it { should_not be_valid }
    end
    describe "with correct value" do
      before { @ticketdetail.direction = "one way" }
      it { should be_valid }
    end
  end
end
