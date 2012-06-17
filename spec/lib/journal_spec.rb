require File.expand_path('spec/spec_helper')

describe Journal do
  use_vcr_cassette record: :new_episodes

  let(:journal) { Journal.new name: "google", url: "http://www.google.com" }
  context "initialization" do
    it "should set attributes" do
      journal.name.should == "google"
      journal.url.should  == "http://www.google.com"
    end
  end

  context "Fixture: a JEP journal" do
    let(:jep) { Journal.jep }

    it "should be a Mechanize::Page" do
      jep.homepage.class.should == Mechanize::Page
    end

    describe "#get_issues" do
      let(:issues) { jep.issues }

      context "first issue" do
        it "should contain June 2012 -- Vol. 102, No. 4 and has the correct link" do
          issues[0].name.should == "Spring 2012 -- Vol. 26, No. 2"
          issues[0].url.should  == "http://www.aeaweb.org/issue.php?doi=10.1257/jep.26.2"
        end
      end

      context "last issue" do
        specify do
          issues.last.name.should == "Winter 1994 -- Vol. 8, No. 1"
          issues.last.url.should == "http://www.aeaweb.org/issue.php?journal=JEP&volume=8&issue=1"
        end
      end
    end
  end
end
