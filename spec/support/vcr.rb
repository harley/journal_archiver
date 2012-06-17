require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassetts'
  #c.hook_into :webmock
end
