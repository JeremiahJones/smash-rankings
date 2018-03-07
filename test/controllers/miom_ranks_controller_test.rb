require 'test_helper'

class MiomRanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @miom_rank = miom_ranks(:one)
  end

  test "should get index" do
    get miom_ranks_url
    assert_response :success
  end

  test "should get new" do
    get new_miom_rank_url
    assert_response :success
  end

  test "should create miom_rank" do
    assert_difference('MiomRank.count') do
      post miom_ranks_url, params: { miom_rank: { change: @miom_rank.change, rank: @miom_rank.rank, score: @miom_rank.score, year: @miom_rank.year } }
    end

    assert_redirected_to miom_rank_url(MiomRank.last)
  end

  test "should show miom_rank" do
    get miom_rank_url(@miom_rank)
    assert_response :success
  end

  test "should get edit" do
    get edit_miom_rank_url(@miom_rank)
    assert_response :success
  end

  test "should update miom_rank" do
    patch miom_rank_url(@miom_rank), params: { miom_rank: { change: @miom_rank.change, rank: @miom_rank.rank, score: @miom_rank.score, year: @miom_rank.year } }
    assert_redirected_to miom_rank_url(@miom_rank)
  end

  test "should destroy miom_rank" do
    assert_difference('MiomRank.count', -1) do
      delete miom_rank_url(@miom_rank)
    end

    assert_redirected_to miom_ranks_url
  end
end
