class Journal
  attr_accessor :name, :url

  def initialize(args = {})
    if args.is_a? Hash
      @name = args[:name]
      @url  = args[:url]
      @agent = Mechanize.new
    elsif args.is_a? Array
      @name, @url = args
    else
      puts "UNSUPPORTED: #{args.inspect}"
    end

    @agent = Mechanize.new
  end

  def host
    uri = URI.parse(@url)
    uri.scheme + "://" + uri.host
  end

  def base_dir
    "output"
  end

  def mkdir
    dir = File.join(base_dir, name)
    Dir.mkdir(dir) unless File.exists?(dir)
  end

  def homepage
    @homepage = @agent.get url
  end

  def middle_column
    homepage.search("td#columnMiddle")
  end

  def issue_link_pattern
    %r{/issue\.php}
  end

  def issue_links
    @issue_links = middle_column.search("a").select{|a| a['href'] =~ issue_link_pattern }
  end

  def issues
    @issues = []
    issue_links.map do |a|
      name = "#{a.text}#{a.next.text if a.next}"
      # sanitize name first
      name = name.strip.gsub("\n", "")
      @issues.push Issue.new name: name,
                              url: URI.join(host, a['href']).to_s
    end
    @issues
  end

  # FOR TESTING
  class << self
    POPULAR = {
      aer:    ["American Economic Review", "http://www.aeaweb.org/aer/contents/index.php"],
      jep:    ["Journal of Economic Perspectives", "http://www.aeaweb.org/jep/contents/index.php"],
      aej_ae: ["American Economic Journal: Applied Economics", "http://www.aeaweb.org/aej-applied/contents/"],
      aej_m:  ["American Economic Journal: Microeconomics", "http://www.aeaweb.org/aej- micro/contents/"]
    }

    def aer
      @aer ||= new POPULAR[:aer][0], POPULAR[:aer][1]
    end

    def jep
      @jep ||= new POPULAR[:jep]
    end

    def aej_ae
      @aej_ae ||= new POPULAR[:aej_ae]
    end

    def aej_m
      @aej_m ||= new POPULAR[:aej_m]
    end
  end
end
