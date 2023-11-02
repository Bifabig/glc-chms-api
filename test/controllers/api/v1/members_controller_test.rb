require 'test_helper'

class Api::V1::MembersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_v1_members_index_url
    assert_response :success
  end

  test 'should get show' do
    get api_v1_members_show_url
    assert_response :success
  end

  test 'should get create' do
    get api_v1_members_create_url
    assert_response :success
  end

  test 'should get update' do
    get api_v1_members_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get api_v1_members_destroy_url
    assert_response :success
  end
end
