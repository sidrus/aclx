require 'test_helper'

class IdCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get id_cards_select_url
    assert_response :success
  end

  test "should get print" do
    get id_cards_print_url
    assert_response :success
  end

end
