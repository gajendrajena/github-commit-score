class Commit
	attr_accessor :id, :type, :actor, :repo, :payload, :public, :created_at, :org

	def initialize commit_as_json
		[:id, :type, :actor, :repo, :payload, :public, :created_at, :org].each do |el|
			self.send("#{el.to_s}=", commit_as_json[el])
		end
	end
end