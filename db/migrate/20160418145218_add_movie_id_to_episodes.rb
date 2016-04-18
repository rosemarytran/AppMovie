class AddMovieIdToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :movie_id, :integer
  end
end
