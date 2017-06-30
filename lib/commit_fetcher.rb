require 'net/http'
require 'rubygems'
require 'json'
require_relative 'commit'

class CommitFetcher

	attr_accessor :github_username, :res, :commits

	def initialize(github_username)
		@github_username = github_username
		@commits = []
		@res = ""
	end

	# fetch commits from json
	def fetch
		return "" if @github_username.nil? || @github_username.empty?

		uri = URI("https://api.github.com/users/#{@github_username}/events/public")
		begin
			Net::HTTP.get(uri)
		rescue Exception => e
			puts e.message
		end
	end

	# parse the response into commits
	def parse
		res_as_json = []
		return [] if @res.empty? || @res.nil?
		begin
			res_as_json = JSON.parse(@res)
		rescue Exception => e
			puts e.message
		end
			@commits = res_as_json.collect{ |commit| Commit.new(commit) } if !res_as_json.empty?
	end
end
