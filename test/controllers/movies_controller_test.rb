require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get "/"
    assert_response :success
  end

  test "should return a table for mononoke" do
    post search_url, params: { movie_name: 'la ligne verte' }
    assert_select 'table'
    assert_select 'td', 'The Green Mile'
  end

  test "should return a sorry msg if nothing is found" do
    post search_url, params: { movie_name: 'aaaaaaaaaaaaaaaaa' }
    assert_select 'h3', 'Sorry, no result for this query.'
  end
end
