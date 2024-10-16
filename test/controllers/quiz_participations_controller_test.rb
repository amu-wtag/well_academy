require "test_helper"

class QuizParticipationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_participations_index_url
    assert_response :success
  end

  test "should get show" do
    get quiz_participations_show_url
    assert_response :success
  end

  test "should get new" do
    get quiz_participations_new_url
    assert_response :success
  end

  test "should get edit" do
    get quiz_participations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get quiz_participations_destroy_url
    assert_response :success
  end
end
