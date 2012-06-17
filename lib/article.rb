class Article
  attr_accessor :name, :section, :url
  def initialize(hash = {})
    self.name = hash[:name]
    self.url  = hash[:url]
    self.section = hash[:section]
  end
end
