require 'test/unit'
require_relative '../exercise.rb'

class TC_Exercise < Test::Unit::TestCase

  def test_calculate_score_should_return_score_given_github_username
  	score = Exercise.calculate_score(github_username: 'dhh')
    assert( score > 0, 'score calculated successfully given github_username')
  end

  def test_calculate_score_should_return_score_zero_given_github_empty_username
  	score = Exercise.calculate_score(github_username: '')
    assert( score == 0, 'score calculated successfully given github_username')
  end
end

