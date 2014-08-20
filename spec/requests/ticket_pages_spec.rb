require "spec_helper"

describe "Ticket Pages" do

  subject { page }
  describe "booking page" do
    before { visit booking_path }

    it { should have_content("Find Buses") }
    it { should have_title("Booking") }
    
  end

  describe "booking" do
    before { visit booking_path }
    let(:submit) { "Find Buses" }
    describe "with invalid information" do
      it "should not be accepted" do
        expect { click_button submit }.not_to change(TicketDetail, :count)
      end
    end
    describe "with valid information" do
      before do
        fill_in "From", with: "Mangalapuram"
        fill_in "To", with: "Kormangla"
        fill_in "Date of Journey", with: "20/05/2014"
        choose "ticket_detail_direction_one_way"
      end
      

      it  "should be accepted" do
        expect { click_button submit }.to change(TicketDetail, :count).by(1)
      end
    end
  end
end
