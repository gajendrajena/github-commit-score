require_relative 'lib/commit_fetcher'
require_relative 'lib/score_calculator'


class Exercise

	def self.calculate_score(options={})
		commit_fetcher = CommitFetcher.new(options[:github_username])
		commit_fetcher.res = commit_fetcher.fetch
		commit_fetcher.parse

		ScoreCalculator.execute(commit_fetcher.commits)
	end

end

