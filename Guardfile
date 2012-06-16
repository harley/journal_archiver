# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group :rspec do
  guard :rspec do
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^spec/.+_spec\.rb$})
  end
end
