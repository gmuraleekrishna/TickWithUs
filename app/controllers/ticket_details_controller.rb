class TicketDetailsController < ApplicationController

  def show
  end
 
  def new
    @ticket_detail = TicketDetail.new
  end

 def create
   @ticket_detail = TicketDetail.new(ticket_params)
   
    if @ticket_detail.save
      redirect_to search_path
    else
      render 'new'
    end
 end

 def status
   redirect_to results_path and return  unless thread_alive? 
   render 'search'
 end

 def search
   thread =  Thread.new { sleep 10 }
   cookies[:threads] = thread.object_id
   render 'search'
 end
 
 private
 def thread_alive?
   ObjectSpace._id2ref(cookies[:threads].to_i).alive?
 end
 def ticket_params
     params.require(:ticket_detail).permit(:from, :to, :journey_date, :direction)
   end  
end

