class Commit
  attr_accessor :id, :type#, :actor, :repo, :payload, :public, :created_at, :org

  def initialize commit_as_json
    return nil if commit_as_json.nil? || commit_as_json.empty?
    # collecting the attributes for json data
    @id = commit_as_json[:id] || commit_as_json["id"]
    @type = commit_as_json[:type] || commit_as_json["type"]
  end
end
