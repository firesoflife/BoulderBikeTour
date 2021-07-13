require "test_helper"

class RacersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @racer = racers(:one)
  end

  test "should get index" do
    get racers_url
    assert_response :success
  end

  test "should get new" do
    get new_racer_url
    assert_response :success
  end

  test "should create racer" do
    assert_difference('Racer.count') do
      post racers_url, params: { racer: { city: @racer.city, f_name: @racer.f_name, l_name: @racer.l_name, lat: @racer.lat, lng: @racer.lng, state: @racer.state } }
    end

    assert_redirected_to racer_url(Racer.last)
  end

  test "should show racer" do
    get racer_url(@racer)
    assert_response :success
  end

  test "should get edit" do
    get edit_racer_url(@racer)
    assert_response :success
  end

  test "should update racer" do
    patch racer_url(@racer), params: { racer: { city: @racer.city, f_name: @racer.f_name, l_name: @racer.l_name, lat: @racer.lat, lng: @racer.lng, state: @racer.state } }
    assert_redirected_to racer_url(@racer)
  end

  test "should destroy racer" do
    assert_difference('Racer.count', -1) do
      delete racer_url(@racer)
    end

    assert_redirected_to racers_url
  end
end
