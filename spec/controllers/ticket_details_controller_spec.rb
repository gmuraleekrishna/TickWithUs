require "spec_helper"

describe TicketDetailsController do
  let(:ticket_detail) { FactoryGirl.create(:ticket_detail) }
  describe "with valid information" do
    it "should create a ticket_detail" do
      expect { xhr :post, :create, { "ticket_detail" => {"from" => ticket_detail.from, "to" => ticket_detail.to, "journey_date" => ticket_detail.journey_date, "direction" => ticket_detail.direction }} }.to change(TicketDetail, :count)
    end
  end
  describe "without valid data" do
     it "should not create a ticket_detail" do
      expect { xhr :post, :create, { "ticket_detail" => {"from" => " ", "to" => " ", "journey_date" => " ", "direction" => " " }} }.not_to change(TicketDetail, :count)
     end
  end
     
end
