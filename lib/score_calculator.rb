class ScoreCalculator
  include Enumerable

  SCORE_MAP = {
  	"IssuesEvent"=> 7,
  	"IssueCommentEvent"=> 6,
  	"PushEvent"=> 5,
  	"PullRequestReviewCommentEvent"=> 4,
  	"WatchEvent"=> 3,
  	"CreateEvent"=> 2
  }
  SCORE_MAP.default = 1

  def self.execute commits
    return 0 if commits.nil? || commits.empty?
    scores = commits.collect {|commit| SCORE_MAP[commit.type] if commit.id }
    scores.compact.sum
  end

end
