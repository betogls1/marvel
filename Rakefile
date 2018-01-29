require "bundler/gem_tasks"

require 'rake/testtask'
Rake::TestTask.new do |test|
	test.libs << 'lib' << 'test'
	test.ruby_opts << "-rubygems"
	test.pattern = 'test/**/*_test.rb'
	test.verbose = true
end

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
