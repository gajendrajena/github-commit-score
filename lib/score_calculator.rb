class ScoreCalculator

  SCORE_MAP = { "IssuesEvent" => 7,
                "IssueCommentEvent" => 6,
                "PushEvent" => 5,
                "PullRequestReviewCommentEvent" => 4,
                "WatchEvent" => 3,
                "CreateEvent" => 2
                }
  def self.execute commits
    scores = commits.collect{|commit| SCORE_MAP[commit.type] || 1}
    scores.inject(0){|sum,x| sum + x }
  end
end
