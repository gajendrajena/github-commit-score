require 'test/unit'

require 'mocha/test_unit'

class TC_CommitFetcher < Test::Unit::TestCase
  def setup
  	@commit_fetcher = CommitFetcher.new('dhh')
  	@commit_fetcher_empty = CommitFetcher.new('')

  end

  def test_fetch
  	@commit_fetcher.res = @commit_fetcher.fetch
    assert !@commit_fetcher.res.empty?
  end

  def test_parse
  	@commit_fetcher.res = @commit_fetcher.fetch
  	@commit_fetcher.parse
    assert !@commit_fetcher.commits.empty?
  end
end