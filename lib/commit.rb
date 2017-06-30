class Commit
  attr_accessor :id, :type#, :actor, :repo, :payload, :public, :created_at, :org

  def initialize commit_as_json
    return nil if commit_as_json.nil? || commit_as_json.empty?

    # [:id, :type, :actor, :repo, :payload, :public, :created_at, :org].each do |el|
    #   puts "#{el.inspect} -- #{commit_as_json[el.to_s]}"
    #   self.send("#{el.to_s}=", commit_as_json[el.to_s]) if !commit_as_json[el].nil?
    # end

    # collecting the attributes for json data
    @id = commit_as_json[:id] || commit_as_json["id"]
    @type = commit_as_json[:type] || commit_as_json["type"]

  end
end
