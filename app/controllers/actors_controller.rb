class ActorsController < ApplicationController
  def index
    #@actors = Actor.all
    @filterrific = initialize_filterrific(
    Actor,
    params[:filterrific],
    available_filters: [:search_query],
    ) or return
    @actors = @filterrific.find.paginate(per_page: 12, page: params[:page])
    
    respond_to do |format|
        format.html
        format.js
    end
  end
  
  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
  end
end
