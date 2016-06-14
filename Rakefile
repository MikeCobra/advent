require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = Dir.glob('spec/unit**/*_spec.rb')
  t.rspec_opts = '--format documentation'
end

task test: [:unit]

task default: [:test]
