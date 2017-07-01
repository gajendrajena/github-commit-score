require 'test/unit'
require_relative '../exercise.rb'

class TC_Exercise < Test::Unit::TestCase

  def setup
    @commit_as_json = '[{"id": "5966317355","type": "CreateEvent"}]'
  end

  def test_calculate_score_should_return_score_given_github_username
    CommitFetcher.any_instance.stubs(:fetch).returns(@commit_as_json)
    score = Exercise.calculate_score(github_username: 'dhh')
    assert( score == 2, 'score calculated successfully given github_username')
  end

  def test_calculate_score_should_return_score_zero_given_github_empty_username
    CommitFetcher.any_instance.stubs(:fetch).returns("")
    score = Exercise.calculate_score(github_username: '')
    assert( score == 0, 'score calculated to 0 for empty username')
  end
end

