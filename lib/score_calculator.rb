class ScoreCalculator

  SCORE_MAP = { "IssuesEvent" => 7,
                "IssueCommentEvent" => 6,
                "PushEvent" => 5,
                "PullRequestReviewCommentEvent" => 4,
                "WatchEvent" => 3,
                "CreateEvent" => 2
                }

  def self.execute commits
    score = 0
    return score if commits.nil? || commits.empty?
    scores = commits.collect do|commit|
      if commit.id
        SCORE_MAP[commit.type] || 1
      else
        0
      end
    end

    score = scores.inject(0){|sum,x| sum + x }
  end
end
