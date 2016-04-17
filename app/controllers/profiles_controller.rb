class ProfilesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies_following = @user.followees(Movie)
  end
end
