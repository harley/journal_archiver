require File.expand_path('spec/spec_helper')

describe Archiver do
  let(:journal) { Journal.new name: 'google', url: 'http://www.google.com' }
  let(:archiver) { Archiver.new journal}
  describe "#make_journal_dir" do
    it "should call mkdir with the right path" do
      dir = File.join(archiver.base_dir, "google")
      File.should_receive(:exists?).with(dir).and_return { false }
      Dir.should_receive(:mkdir).with(dir)

      archiver.make_journal_dir
    end
  end
end
