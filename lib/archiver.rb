class Archiver
  attr_accessor :journal

  def initialize(journal)
    @journal = journal
  end

  def base_dir
    "output"
  end

  def make_journal_dir
    dir = File.join(base_dir, journal.name)
    Dir.mkdir(dir) unless File.exists?(dir)
  end

  def generate
    # create a folder with journal's name
  end
end
