require 'test_helper'

class LpgSubsidiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lpg_subsidy = lpg_subsidies(:one)
  end

  test "should get index" do
    get lpg_subsidies_url
    assert_response :success
  end

  test "should get new" do
    get new_lpg_subsidy_url
    assert_response :success
  end

  test "should create lpg_subsidy" do
    assert_difference('LpgSubsidy.count') do
      post lpg_subsidies_url, params: { lpg_subsidy: { citizen_id: @lpg_subsidy.citizen_id } }
    end

    assert_redirected_to lpg_subsidy_url(LpgSubsidy.last)
  end

  test "should show lpg_subsidy" do
    get lpg_subsidy_url(@lpg_subsidy)
    assert_response :success
  end

  test "should get edit" do
    get edit_lpg_subsidy_url(@lpg_subsidy)
    assert_response :success
  end

  test "should update lpg_subsidy" do
    patch lpg_subsidy_url(@lpg_subsidy), params: { lpg_subsidy: { citizen_id: @lpg_subsidy.citizen_id } }
    assert_redirected_to lpg_subsidy_url(@lpg_subsidy)
  end

  test "should destroy lpg_subsidy" do
    assert_difference('LpgSubsidy.count', -1) do
      delete lpg_subsidy_url(@lpg_subsidy)
    end

    assert_redirected_to lpg_subsidies_url
  end
end
