class MoviesController < ApplicationController
   def index
    @movies = Movie.all
   end
 

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @episodes = @movie.episodes
  end
  
  def following
    current_user.follow!(Movie.find(params[:id]))
    # if current_page?(controller: 'explore', action: 'index')
    redirect_to root_path
    # else
    #     redirect_to movie_path(Movie.find(params[:id]))
    # end
  end
  
   def add
    @movie = Movie.find(params[:id])
    current_user.follow!(@movie)
    redirect_to movie_path(@movie)
   end
  
  def remove
    @movie = Movie.find(params[:id])
    current_user.unfollow!(@movie)
    redirect_to movie_path(@movie)
  end
  
end
