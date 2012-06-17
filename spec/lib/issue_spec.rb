require File.expand_path('spec/spec_helper')

describe Issue do
  use_vcr_cassette record: :new_episodes

  context "new" do
    it "should set name" do
      issue = Issue.new name: "June 2012 -- Vol. 102, No. 4"
      issue.name.should == "June 2012 -- Vol. 102, No. 4"
    end
  end

  context "Fixture: a JEP issue" do
    let(:jep_issue) { Issue.jep_issue }

    describe "#page" do
      let(:page) { jep_issue.page }
      it "should be a Mechanize::Page" do
        page.class.should == Mechanize::Page
      end
    end
  end

  context "Fixture: an AER issue" do
    let(:aer) { Issue.aer_issue }

    describe "#articles" do
      let(:articles) { aer.articles }

      it "should contain Front Matter and full text link" do
        article = articles.first
        article.name.should == "Front Matter"
        article.url.should == "http://www.aeaweb.org/atypon.php?return_to=/doi/pdfplus/10.1257/aer.102.3.i"
        article.section.should be_nil
      end

      it "should contain Foreword and full text link" do
        article = articles[1]
        article.name.should == "Foreword"
        article.url.should  == "http://www.aeaweb.org/atypon.php?return_to=/doi/pdfplus/10.1257/aer.102.3.x"
        article.section.should be_nil
      end

      it "should contain section info where applicable" do
        article = articles[3]
        article.section.should == "Richard T. Ely Lecture"
        article.name.should == "Does the Current Account Still Matter?"
        article.url.should  == "http://www.aeaweb.org/atypon.php?return_to=/doi/pdfplus/10.1257/aer.102.3.1"
      end
    end
  end
end
