class MoviesController < ApplicationController
   def index
    @movies = Movie.all
   end
 

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @episodes = @movie.episodes
  end
  
#   def following
#     @movie = Movie.find(params[:id])
#     current_user.follow!(@movie)
#     current_user.followees_count += 1
#     @movie.followers_count += 1
#     redirect_to root_path
#   end
  
   def add
    @movie = Movie.find(params[:id])
    current_user.follow!(@movie)
    current_user.followees_count += 1
    @movie.followers_count += 1
    redirect_to(:back)
   end
  
  def remove
    @movie = Movie.find(params[:id])
    current_user.unfollow!(@movie)
    current_user.followees_count -=  1
    @movie.followers_count -= 1
    redirect_to movie_path(@movie)
  end
  
end
