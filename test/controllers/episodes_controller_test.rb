require 'test_helper'

class EpisodesControllerTest < ActionController::TestCase
  setup do
    @episode = episodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:episodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create episode" do
    assert_difference('Episode.count') do
      post :create, episode: { ep_broadcast: @episode.ep_broadcast, ep_date: @episode.ep_date, ep_number: @episode.ep_number, ep_plot: @episode.ep_plot, ep_time: @episode.ep_time, ep_title: @episode.ep_title }
    end

    assert_redirected_to episode_path(assigns(:episode))
  end

  test "should show episode" do
    get :show, id: @episode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @episode
    assert_response :success
  end

  test "should update episode" do
    patch :update, id: @episode, episode: { ep_broadcast: @episode.ep_broadcast, ep_date: @episode.ep_date, ep_number: @episode.ep_number, ep_plot: @episode.ep_plot, ep_time: @episode.ep_time, ep_title: @episode.ep_title }
    assert_redirected_to episode_path(assigns(:episode))
  end

  test "should destroy episode" do
    assert_difference('Episode.count', -1) do
      delete :destroy, id: @episode
    end

    assert_redirected_to episodes_path
  end
end