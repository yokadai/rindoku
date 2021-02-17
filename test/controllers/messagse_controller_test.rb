require 'test_helper'

class MessagseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messagse_index_url
    assert_response :success
  end

end
