require 'test/unit'

class TC_ScoreCalculator < Test::Unit::TestCase

  def setup
    @commit_as_json = '[{"id": "5966317355","type": "CreateEvent"}]'
  end

  def test_calculate_score_should_return_score_given_valid_commits_as_json
    commits = [Commit.new({"id": "5966317355","type": "CreateEvent"})]
    CommitFetcher.any_instance.stubs(:fetch).returns(@commit_as_json)
    score = ScoreCalculator.execute(commits)
    assert( score == 2, 'score calculated successfully given github_username')
  end

  def test_calculate_score_should_return_score_zero_given_github_empty_comit_json
    commits = [Commit.new({})]
    CommitFetcher.any_instance.stubs(:fetch).returns("")
    score = ScoreCalculator.execute(commits)
    assert( score == 0, 'score calculated successfully given github_username')
  end
end
