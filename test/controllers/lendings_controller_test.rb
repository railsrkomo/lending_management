require 'test_helper'

class LendingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lending = lendings(:one)
  end

  test "should get index" do
    get lendings_url
    assert_response :success
  end

  test "should get new" do
    get new_lending_url
    assert_response :success
  end

  test "should create lending" do
    assert_difference('Lending.count') do
      post lendings_url, params: { lending: { borrower_id: @lending.borrower_id, expected_return_at: @lending.expected_return_at, lender_id: @lending.lender_id, lending_at: @lending.lending_at, name: @lending.name } }
    end

    assert_redirected_to lending_url(Lending.last)
  end

  test "should show lending" do
    get lending_url(@lending)
    assert_response :success
  end

  test "should get edit" do
    get edit_lending_url(@lending)
    assert_response :success
  end

  test "should update lending" do
    patch lending_url(@lending), params: { lending: { borrower_id: @lending.borrower_id, expected_return_at: @lending.expected_return_at, lender_id: @lending.lender_id, lending_at: @lending.lending_at, name: @lending.name } }
    assert_redirected_to lending_url(@lending)
  end

  test "should destroy lending" do
    assert_difference('Lending.count', -1) do
      delete lending_url(@lending)
    end

    assert_redirected_to lendings_url
  end
end
