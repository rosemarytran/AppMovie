class ExploreController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @movies = Movie.all
    @actors = Actor.all
  end
  
end
