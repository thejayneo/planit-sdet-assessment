require 'rake'
require 'rake/testtask'
require 'rspec/core/rake_task'


RSpec::Core::RakeTask.new(:spec) do |t|
t.pattern = Dir.glob('Task_One/tests/*_test.rb')
t.rspec_opts = '--format html'
t.rspec_opts << ' --out results.html'

end

task :default => :spec