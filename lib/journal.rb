class Journal
  attr_accessor :name, :url

  def initialize(hash = {})
    @name = hash[:name]
    @url  = hash[:url]
  end

  def base_dir
    "output"
  end

  def mkdir
    dir = File.join(base_dir, name)
    Dir.mkdir(dir) unless File.exists?(dir)
  end

  def get_issues
    []
  end
end
