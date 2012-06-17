require File.expand_path('spec/spec_helper')

describe Archiver do
  let(:journal) { Journal.new name: 'google', url: 'http://www.google.com' }
  let(:archiver) { Archiver.new journal}
  describe "#prepare_dir" do
    let(:dir) { File.join(archiver.base_dir, "google") }
    it "should call mkdir with the right path" do
      File.should_receive(:exists?).with(dir).and_return { false }
      Dir.should_receive(:mkdir).with(dir)

      archiver.prepare_dir(dir)
    end
  end

  describe "#sanitize_filename" do
    it "should replace / in filename" do
      archiver.sanitize_filename("The good/bad     of things\n  ").should == "The good-bad of things"
    end
  end
end
