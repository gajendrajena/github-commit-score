class Commit
  attr_accessor :id, :type, :actor, :repo, :payload, :public, :created_at, :org

  def initialize commit_as_json
    return nil if commit_as_json.nil? || commit_as_json.empty?

    [:id, :type, :actor, :repo, :payload, :public, :created_at, :org].each do |el|
      self.send("#{el.to_s}=", commit_as_json[el]) if !commit_as_json[el].nil?
    end
  end
end
