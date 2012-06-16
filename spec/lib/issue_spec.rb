require File.expand_path('spec/spec_helper')

describe Issue do
  context "new" do
    it "should set name" do
      issue = Issue.new name: "June 2012 -- Vol. 102, No. 4"
      issue.name.should == "June 2012 -- Vol. 102, No. 4"
    end
  end
end
