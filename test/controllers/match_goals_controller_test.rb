require 'test_helper'

class MatchGoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get match_goals_new_url
    assert_response :success
  end

  test "should get create" do
    get match_goals_create_url
    assert_response :success
  end

  test "should get edit" do
    get match_goals_edit_url
    assert_response :success
  end

  test "should get update" do
    get match_goals_update_url
    assert_response :success
  end

  test "should get destroy" do
    get match_goals_destroy_url
    assert_response :success
  end

end
