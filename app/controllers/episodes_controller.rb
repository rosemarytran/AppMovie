class EpisodesController < ApplicationController
  #before_action :set_episode, only: [:show, :edit, :update, :destroy]

  # GET /episodes
  def index
    @movie = Movie.find(params[:movie_id])
    @episodes = @movie.episodes
  end

end
