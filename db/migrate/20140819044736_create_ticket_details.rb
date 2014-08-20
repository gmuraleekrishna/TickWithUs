class CreateTicketDetails < ActiveRecord::Migration
  def change
    create_table :ticket_details do |t|
      t.string :from
      t.string :to
      t.date :journey_date
      t.string :direction
    end
  end
end
