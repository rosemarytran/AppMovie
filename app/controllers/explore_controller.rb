class ExploreController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @movies = Movie.order("release_year desc").take(8)
    @actors = Actor.last(8)
  end
  
  
end
