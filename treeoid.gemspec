# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{treeoid}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy Weiland"]
  s.date = %q{2010-07-28}
  s.description = %q{With treeoid, you can create tree-style hierarchies for Mongoid classes. Just "include Treeoid" and you're ready to roll. You get a "parent" accessor, a "children" array, plus a scope called "hierarchically" that spits everything out in hierarchical order - perfect for front end rendering.}
  s.email = %q{jeremy6d@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "features/step_definitions/treeoid_steps.rb",
     "features/support/env.rb",
     "features/treeoid.feature",
     "lib/treeoid.rb",
     "test/helper.rb",
     "test/test_treeoid.rb",
     "treeoid.gemspec"
  ]
  s.homepage = %q{http://github.com/jeremy6d/treeoid}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Tree structure mixin for Mongoid::Document classes}
  s.test_files = [
    "test/helper.rb",
     "test/test_treeoid.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, [">= 2.0.0.beta11"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, ["~> 2.11.1"])
      s.add_development_dependency(%q<jnunemaker-matchy>, [">= 0.4.0"])
      s.add_development_dependency(%q<cucumber>, ["~> 0.8.5"])
    else
      s.add_dependency(%q<mongoid>, [">= 2.0.0.beta11"])
      s.add_dependency(%q<thoughtbot-shoulda>, ["~> 2.11.1"])
      s.add_dependency(%q<jnunemaker-matchy>, [">= 0.4.0"])
      s.add_dependency(%q<cucumber>, ["~> 0.8.5"])
    end
  else
    s.add_dependency(%q<mongoid>, [">= 2.0.0.beta11"])
    s.add_dependency(%q<thoughtbot-shoulda>, ["~> 2.11.1"])
    s.add_dependency(%q<jnunemaker-matchy>, [">= 0.4.0"])
    s.add_dependency(%q<cucumber>, ["~> 0.8.5"])
  end
end
