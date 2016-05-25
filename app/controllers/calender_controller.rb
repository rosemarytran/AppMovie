class CalenderController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = current_user.followees(Movie)
    if @movies.length > 0
      @today = Time.now           # Current time
      @days = []
      @all_eps = []
      @eps_hash = Hash.new{|hash,key| hash[key] = [] }
      @movies.each do |movie|
        for i in -5..5
            @days.push(@today + i*86400)
            @all_eps = Episode.where(movie_id: movie.id, ep_date: @days.at(i+5).strftime("%Y-%m-%d")) #These are episodes that match required days
            @all_eps.each do |ep|
              @eps_hash[i].push(ep)
            end
        end
      end
    end
  end
  
end
