class CalenderController < ApplicationController
  def index
    @all_eps = Episode.all
    @today = Time.now
    @yesterday = @today - 86400
    @tomorrow = @today + 86400
  end

  def show
  end
end
