require 'test_helper'

class FellowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fellow = fellows(:one)
  end

  test "should get index" do
    get fellows_url
    assert_response :success
  end

  test "should get new" do
    get new_fellow_url
    assert_response :success
  end

  test "should create fellow" do
    assert_difference('Fellow.count') do
      post fellows_url, params: { fellow: { friend_id: @fellow.friend_id, own_id: @fellow.own_id, reason_of: @fellow.reason_of, relation_since: @fellow.relation_since } }
    end

    assert_redirected_to fellow_url(Fellow.last)
  end

  test "should show fellow" do
    get fellow_url(@fellow)
    assert_response :success
  end

  test "should get edit" do
    get edit_fellow_url(@fellow)
    assert_response :success
  end

  test "should update fellow" do
    patch fellow_url(@fellow), params: { fellow: { friend_id: @fellow.friend_id, own_id: @fellow.own_id, reason_of: @fellow.reason_of, relation_since: @fellow.relation_since } }
    assert_redirected_to fellow_url(@fellow)
  end

  test "should destroy fellow" do
    assert_difference('Fellow.count', -1) do
      delete fellow_url(@fellow)
    end

    assert_redirected_to fellows_url
  end
end
