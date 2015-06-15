class DashboardController < ApplicationController
  def index
    @timeslots = Timeslot.all.order(start: :asc)
  end
end
