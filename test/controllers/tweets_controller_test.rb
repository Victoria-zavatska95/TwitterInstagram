require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
    test "should get show" do
    get profile_show_url
    assert_response :success
  end
end
