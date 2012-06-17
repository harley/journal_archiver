require File.expand_path("journal_archiver.rb")

#require 'webmock/rspec'
Dir[File.expand_path("spec/support/**/*.rb")].each {|f| require f}

#WebMock.disable_net_connect!

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end

