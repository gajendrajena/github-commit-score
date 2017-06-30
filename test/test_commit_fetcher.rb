require 'test/unit'

require 'mocha/test_unit'

class TC_CommitFetcher < Test::Unit::TestCase
  def setup
  	@commit_fetcher = CommitFetcher.new('dhh')
  	@commit_fetcher_empty = CommitFetcher.new('')
  end

  def test_fetch_should_return_json_string_of_commits_given_valid_github_username
  	@commit_fetcher.res = @commit_fetcher.fetch
    assert !@commit_fetcher.res.empty?
  end

  def test_fetch_should_return_empty_string_given_empty_github_username
  	@commit_fetcher_empty.res = @commit_fetcher_empty.fetch
    assert @commit_fetcher.res.empty?
  end

  def test_parse_should_return_array_of_commits_given_valid_response
  	@commit_fetcher.res = @commit_fetcher.fetch
  	@commit_fetcher.parse
    assert !@commit_fetcher.commits.empty?
  end

  def test_parse_should_return_empty_array_given_empty_response
  	@commit_fetcher_empty.res = @commit_fetcher_empty.fetch
  	@commit_fetcher_empty.parse
  	puts "@commit_fetcher_empty.commits : #{@commit_fetcher_empty.commits.inspect}"
    assert @commit_fetcher_empty.commits == []
  end
end