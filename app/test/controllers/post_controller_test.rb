require "test_helper"

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get user:references" do
    get post_user:references_url
    assert_response :success
  end

  test "should get url:string" do
    get post_url:string_url
    assert_response :success
  end

  test "should get upvotes:integer" do
    get post_upvotes:integer_url
    assert_response :success
  end

  test "should get headline:string" do
    get post_headline:string_url
    assert_response :success
  end

  test "should get body:text" do
    get post_body:text_url
    assert_response :success
  end

  test "should get argument:boolean" do
    get post_argument:boolean_url
    assert_response :success
  end
end
