class AddFollowersCountToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :followers_count, :integer, :default => 0
  end
end
