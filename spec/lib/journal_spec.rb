require File.expand_path('spec/spec_helper')

describe Journal do
  context "initialization" do
    it "should set attributes" do
      journal = Journal.new name: "google", url: "http://www.google.com"
      journal.name.should == "google"
      journal.url.should  == "http://www.google.com"
    end
  end
end
