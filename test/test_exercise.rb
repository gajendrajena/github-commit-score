require 'test/unit'
require_relative '../exercise.rb'

class TC_Exercise < Test::Unit::TestCase

  def test_calculate_score
  	score = Exercise.calculate_score(github_username: 'dhh')
    assert( score == 30, 'Assertion was false.')
  end
end

