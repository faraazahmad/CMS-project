require 'test_helper'

class EduSubsidiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edu_subsidy = edu_subsidies(:one)
  end

  test "should get index" do
    get edu_subsidies_url
    assert_response :success
  end

  test "should get new" do
    get new_edu_subsidy_url
    assert_response :success
  end

  test "should create edu_subsidy" do
    assert_difference('EduSubsidy.count') do
      post edu_subsidies_url, params: { edu_subsidy: { citizen_id: @edu_subsidy.citizen_id } }
    end

    assert_redirected_to edu_subsidy_url(EduSubsidy.last)
  end

  test "should show edu_subsidy" do
    get edu_subsidy_url(@edu_subsidy)
    assert_response :success
  end

  test "should get edit" do
    get edit_edu_subsidy_url(@edu_subsidy)
    assert_response :success
  end

  test "should update edu_subsidy" do
    patch edu_subsidy_url(@edu_subsidy), params: { edu_subsidy: { citizen_id: @edu_subsidy.citizen_id } }
    assert_redirected_to edu_subsidy_url(@edu_subsidy)
  end

  test "should destroy edu_subsidy" do
    assert_difference('EduSubsidy.count', -1) do
      delete edu_subsidy_url(@edu_subsidy)
    end

    assert_redirected_to edu_subsidies_url
  end
end
