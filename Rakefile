require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end

task :tt do
  `tt crisp.treetop`
end

task :default => [:tt, :test] do
end
