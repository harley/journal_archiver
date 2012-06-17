class Archiver
  attr_accessor :journal

  def initialize(journal)
    @journal = journal
    @agent = journal.agent
  end

  def base_dir
    "output"
  end

  def journal_dir
    File.join(base_dir, journal.name)
  end

  # create a folder with journal's name
  def prepare_dir(dir)
    puts dir
    unless ENV['DRY']
      Dir.mkdir(dir) unless File.exists?(dir)
    end
  end

  def issue_dir(issue)
    File.join(journal_dir, issue.name)
  end

  def article_dir(issue, article)
    File.join issue_dir(issue), article.section||''
  end

  def generate
    prepare_dir journal_dir

    journal.issues.each do |issue|
      prepare_dir issue_dir(issue)

      # save issue pdfs under issue folder
      issue.articles.each do |article|
        article_dir = article_dir(issue, article)
        prepare_dir article_dir

        filepath = File.join article_dir, "#{article.name}.pdf"
        puts "\t#{filepath}"
        unless ENV['DRY']
          if !File.exists?(filepath) or ENV['FORCE']
            issue.agent.get(article.url).save_as(filepath)
          end
        end
      end
      puts
    end
  end
end
