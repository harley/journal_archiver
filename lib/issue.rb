class Issue
  attr_accessor :name
  def initialize(hash = {})
    @name = hash[:name]
  end
end
