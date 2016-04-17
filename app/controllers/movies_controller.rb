class MoviesController < ApplicationController
   def index
    @movies = Movie.all
   end
 

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
  end
  
  def following
    current_user.follow!(Movie.find(params[:id]))
    # if current_page?(controller: 'explore', action: 'index')
    redirect_to root_path
    # else
    #     redirect_to movie_path(Movie.find(params[:id]))
    # end
  end
  
  def unfollowing
    current_user.unfollow!(Movie.find(params[:id]))
    # if current_page?(controller: 'explore', action: 'index')
    redirect_to root_path
    # else
    #     redirect_to movie_path(Movie.find(params[:id]))
    # end
  end
  
end
