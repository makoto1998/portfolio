require "test_helper"

class GoalControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get goal_user_url
    assert_response :success
  end
end
