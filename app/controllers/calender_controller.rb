class CalenderController < ApplicationController
  def index
    @all_eps = Episode.all
    @today = Time.now           # Current time
    @days = Array.new
    for i in -5..5
        @days.push(@today + i*86400)
    end
  end

  def show
  end
end
