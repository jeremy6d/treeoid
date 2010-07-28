require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "treeoid"
    gem.summary = %q{Tree structure mixin for Mongoid::Document classes}
    gem.description = %q{With treeoid, you can create tree-style hierarchies for Mongoid classes. Just "include Treeoid" and you're ready to roll. You get a "parent" accessor, a "children" array, plus a scope called "hierarchically" that spits everything out in hierarchical order - perfect for front end rendering.}
    gem.email = "jeremy6d@gmail.com"
    gem.homepage = "http://github.com/jeremy6d/treeoid"
    gem.authors = ["Jeremy Weiland"]
    gem.add_runtime_dependency "mongoid", ">= 2.0.0.beta11"
    gem.add_development_dependency "thoughtbot-shoulda", "~> 2.11.1"
    gem.add_development_dependency "jnunemaker-matchy", ">= 0.4.0"
    gem.add_development_dependency "cucumber", "~> 0.8.5"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)

  task :features => :check_dependencies
rescue LoadError
  task :features do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "treeoid #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
