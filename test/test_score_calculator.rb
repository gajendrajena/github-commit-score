require 'test/unit'
# require_relative '../store_calculator.rb'
# require_relative '../commit.rb'

class TC_ScoreCalculator < Test::Unit::TestCase

  def setup
    @commit_as_json = {
    "id": "5966317355",
    "type": "CreateEvent",
    "actor": {
      "id": 2741,
      "login": "dhh",
      "display_login": "dhh",
      "gravatar_id": "",
      "url": "https://api.github.com/users/dhh",
      "avatar_url": "https://avatars.githubusercontent.com/u/2741?"
    },
    "repo": {
      "id": 92837461,
      "name": "basecamp/google_sign_in",
      "url": "https://api.github.com/repos/basecamp/google_sign_in"
    },
    "payload": {
      "ref": 'null',
      "ref_type": "repository",
      "master_branch": "master",
      "description": "Sign in (or up) with Google for Rails applications",
      "pusher_type": "user"
    },
    "public": true,
    "created_at": "2017-05-30T13:46:33Z",
    "org": {
      "id": 13131,
      "login": "basecamp",
      "gravatar_id": "",
      "url": "https://api.github.com/orgs/basecamp",
      "avatar_url": "https://avatars.githubusercontent.com/u/13131?"
    }
  }
  end

  def test_calculate_score_should_return_score_given_valid_commits_as_json
    commits = [Commit.new(@commit_as_json)]
    score = ScoreCalculator.execute(commits)
    assert( score == 2, 'score calculated successfully given github_username')
  end

  def test_calculate_score_should_return_score_zero_given_github_empty_comit_json
    commits = [Commit.new({})]
    puts commits[0].inspect
    score = ScoreCalculator.execute(commits)
    puts "score: --------------#{score}"
    assert( score == 0, 'score calculated successfully given github_username')
  end
end

