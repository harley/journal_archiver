class Issue
  attr_accessor :name, :url

  def initialize(hash = {})
    @name = hash[:name]
    @url  = hash[:url]
    @agent = Mechanize.new
  end

  def host
    uri = URI.parse url
    @host = uri.scheme + "://" + uri.host
  end

  def page
    @page ||= @agent.get url
  end

  # get table.main_2col_table node
  def table
    @table ||= page.search("table.main_2col_table")
  end

  def trs
    table.search("> tr")
  end

  def articles
    @articles = []

    # Front Matter, Foreword and Editor's Instructions have 'nil' section
    current_section = nil
    current_article = nil

    # go through each row (tr) of the table trs = table.search("> tr")
    trs.each do |tr|
      # if find a section, set current_section to it
      if h2 = tr.search("td > h2").first
        current_section = h2.text
      end

      # if find an article
      if tr['class'] == "columnMain"
        if article_link = tr.search("a").first
          current_article = Article.new name: article_link.text, section: current_section
        end
      end

      # if find Full-Text Article link
      if full_text_link = tr.search("a").find{|e| e.text == "Full-Text Article"}
        # update article url and add to article list
        current_article.url = URI.join(host, full_text_link['href']).to_s
        @articles.push current_article
      end
    end

    @articles
  end

  # FOR TESTING
  class << self
    def jep_issue
      @jep_issue ||= new name: "Spring 2012 -- Vol. 26, No. 2", url: "http://www.aeaweb.org/issue.php?journal=JEP&volume=26&issue=2"
    end

    def aer_issue
      @aer_issue ||= new name: "May 2012 -- Vol. 102, No. 3", url: "http://www.aeaweb.org/issue.php?doi=10.1257/aer.102.3"
    end
  end
end
