require 'test_helper'

class Api::V1::ChurchesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_v1_churches_index_url
    assert_response :success
  end

  test 'should get show' do
    get api_v1_churches_show_url
    assert_response :success
  end

  test 'should get create' do
    get api_v1_churches_create_url
    assert_response :success
  end

  test 'should get update' do
    get api_v1_churches_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get api_v1_churches_destroy_url
    assert_response :success
  end
end
