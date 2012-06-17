require File.expand_path('spec/spec_helper')

describe Journal do
  let(:journal) { Journal.new name: "google", url: "http://www.google.com" }
  context "initialization" do
    it "should set attributes" do
      journal.name.should == "google"
      journal.url.should  == "http://www.google.com"
    end
  end

  describe "#mkdir" do
    it "should call mkdir with the right path" do
      dir = File.join(journal.base_dir, "google")
      File.should_receive(:exists?).with(dir).and_return { false }
      Dir.should_receive(:mkdir).with(dir)

      journal.mkdir
    end
  end

  context "accessing external url" do
    use_vcr_cassette

    it "should work" do
      require 'net/http'
      response = Net::HTTP.get('www.google.com', '/')
      response.should include "google.com"
    end
  end
end
