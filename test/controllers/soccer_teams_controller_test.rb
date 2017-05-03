require 'test_helper'

class SoccerTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soccer_team = soccer_teams(:one)
  end

  test "should get index" do
    get soccer_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_soccer_team_url
    assert_response :success
  end

  test "should create soccer_team" do
    assert_difference('SoccerTeam.count') do
      post soccer_teams_url, params: { soccer_team: {  } }
    end

    assert_redirected_to soccer_team_url(SoccerTeam.last)
  end

  test "should show soccer_team" do
    get soccer_team_url(@soccer_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_soccer_team_url(@soccer_team)
    assert_response :success
  end

  test "should update soccer_team" do
    patch soccer_team_url(@soccer_team), params: { soccer_team: {  } }
    assert_redirected_to soccer_team_url(@soccer_team)
  end

  test "should destroy soccer_team" do
    assert_difference('SoccerTeam.count', -1) do
      delete soccer_team_url(@soccer_team)
    end

    assert_redirected_to soccer_teams_url
  end
end
