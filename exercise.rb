require_relative 'lib/commit_fetcher'
require_relative 'lib/score_calculator'

class Exercise
  # calculate_score
  def self.calculate_score(options={})
    commit_fetcher = CommitFetcher.new(options[:github_username])
    commit_fetcher.res = commit_fetcher.fetch
    # parse teh json data into commits
    commit_fetcher.parse

    # calculating score for all commits
    ScoreCalculator.execute(commit_fetcher.commits)
  end
end
