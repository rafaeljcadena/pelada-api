require 'test_helper'

class PeladasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pelada = peladas(:one)
  end

  test "should get index" do
    get peladas_url
    assert_response :success
  end

  test "should get new" do
    get new_pelada_url
    assert_response :success
  end

  test "should create pelada" do
    assert_difference('Pelada.count') do
      post peladas_url, params: { pelada: { begin: @pelada.begin, title: @pelada.title } }
    end

    assert_redirected_to pelada_url(Pelada.last)
  end

  test "should show pelada" do
    get pelada_url(@pelada)
    assert_response :success
  end

  test "should get edit" do
    get edit_pelada_url(@pelada)
    assert_response :success
  end

  test "should update pelada" do
    patch pelada_url(@pelada), params: { pelada: { begin: @pelada.begin, title: @pelada.title } }
    assert_redirected_to pelada_url(@pelada)
  end

  test "should destroy pelada" do
    assert_difference('Pelada.count', -1) do
      delete pelada_url(@pelada)
    end

    assert_redirected_to peladas_url
  end
end
