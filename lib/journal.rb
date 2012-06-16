class Journal
  attr_accessor :name, :url

  def initialize(hash = {})
    @name = hash[:name]
    @url  = hash[:url]
  end
end
