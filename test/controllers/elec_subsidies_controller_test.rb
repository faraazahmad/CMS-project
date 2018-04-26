require 'test_helper'

class ElecSubsidiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elec_subsidy = elec_subsidies(:one)
  end

  test "should get index" do
    get elec_subsidies_url
    assert_response :success
  end

  test "should get new" do
    get new_elec_subsidy_url
    assert_response :success
  end

  test "should create elec_subsidy" do
    assert_difference('ElecSubsidy.count') do
      post elec_subsidies_url, params: { elec_subsidy: { citizen_id: @elec_subsidy.citizen_id } }
    end

    assert_redirected_to elec_subsidy_url(ElecSubsidy.last)
  end

  test "should show elec_subsidy" do
    get elec_subsidy_url(@elec_subsidy)
    assert_response :success
  end

  test "should get edit" do
    get edit_elec_subsidy_url(@elec_subsidy)
    assert_response :success
  end

  test "should update elec_subsidy" do
    patch elec_subsidy_url(@elec_subsidy), params: { elec_subsidy: { citizen_id: @elec_subsidy.citizen_id } }
    assert_redirected_to elec_subsidy_url(@elec_subsidy)
  end

  test "should destroy elec_subsidy" do
    assert_difference('ElecSubsidy.count', -1) do
      delete elec_subsidy_url(@elec_subsidy)
    end

    assert_redirected_to elec_subsidies_url
  end
end
