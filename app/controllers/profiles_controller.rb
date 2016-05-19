class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = current_user.followees(Movie)
  end
end
