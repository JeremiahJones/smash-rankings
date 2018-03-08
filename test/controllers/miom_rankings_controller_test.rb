require 'test_helper'

class MiomRankingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @miom_ranking = miom_rankings(:one)
  end

  test "should get index" do
    get miom_rankings_url
    assert_response :success
  end

  test "should get new" do
    get new_miom_ranking_url
    assert_response :success
  end

  test "should create miom_ranking" do
    assert_difference('MiomRanking.count') do
      post miom_rankings_url, params: { miom_ranking: {  } }
    end

    assert_redirected_to miom_ranking_url(MiomRanking.last)
  end

  test "should show miom_ranking" do
    get miom_ranking_url(@miom_ranking)
    assert_response :success
  end

  test "should get edit" do
    get edit_miom_ranking_url(@miom_ranking)
    assert_response :success
  end

  test "should update miom_ranking" do
    patch miom_ranking_url(@miom_ranking), params: { miom_ranking: {  } }
    assert_redirected_to miom_ranking_url(@miom_ranking)
  end

  test "should destroy miom_ranking" do
    assert_difference('MiomRanking.count', -1) do
      delete miom_ranking_url(@miom_ranking)
    end

    assert_redirected_to miom_rankings_url
  end
end
