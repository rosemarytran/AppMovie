class MoviesController < ApplicationController
   def index
    #@movies = Movie.all
    @filterrific = initialize_filterrific(
        Movie,
        params[:filterrific],
        select_options: {
            sorted_by: Movie.options_for_sorted_by
        },
        available_filters: [:search_query, :sorted_by],
    ) or return
    @movies = @filterrific.find.paginate(per_page: 12, page: params[:page])
    
    respond_to do |format|
        format.html
        format.js
    end
   end
 

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @episodes = @movie.episodes
    @episodes_hash = Hash.new
    for i in 1..10
        @episodes_hash[i] = []
    end
    @episodes.each do |ep|
        if ep.ep_number =~ /^S01/
            @episodes_hash[1] << ep
        elsif ep.ep_number =~ /^S02/
            @episodes_hash[2] << ep
        elsif ep.ep_number =~ /^S03/
            @episodes_hash[3] << ep
        elsif ep.ep_number =~ /^S04/
            @episodes_hash[4] << ep
        elsif ep.ep_number =~ /^S05/
            @episodes_hash[5] << ep
        elsif ep.ep_number =~ /^S06/
            @episodes_hash[6] << ep
        elsif ep.ep_number =~ /^S07/
            @episodes_hash[7] << ep
        elsif ep.ep_number =~ /^S08/
            @episodes_hash[8] << ep
        elsif ep.ep_number =~ /^S09/
            @episodes_hash[9] << ep
        elsif ep.ep_number =~ /^S10/
            @episodes_hash[10] << ep
        end
    end
    @nb_of_season = @episodes_hash.length
    for i in 1..@nb_of_season
        if @episodes_hash[i].empty?
             @nb_of_season -= 1
        end
    end
  end
  
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
    redirect_to(:back)
  end
  
end
